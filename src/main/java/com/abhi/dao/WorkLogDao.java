package com.abhi.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.abhi.model.WorkLog;

@Component
public class WorkLogDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	// Insert new work log
	@Transactional
	public int insertWorkLog(WorkLog workLog) {
		return (Integer) hibernateTemplate.save(workLog);
	}

	// Delete work log by id
	@Transactional
	public void deleteWorkLog(int id) {
		WorkLog workLog = hibernateTemplate.get(WorkLog.class, id);
		if (workLog != null) {
			hibernateTemplate.delete(workLog);
		}
	}

	// Update work log
	@Transactional
	public void updateWorkLog(WorkLog workLog) {
		hibernateTemplate.update(workLog);
	}

	// Get single work log by ID
	public WorkLog getWorkLogById(int id) {
		return hibernateTemplate.get(WorkLog.class, id);
	}

	// Get all work logs
	public List<WorkLog> getAllWorkLogs() {
		return hibernateTemplate.loadAll(WorkLog.class);
	}

	// Get work logs by vehicle number
	public List<WorkLog> getWorkLogsByVehicleNo(final String vehicleNo) {
		return hibernateTemplate.execute(new HibernateCallback<List<WorkLog>>() {
			
			public List<WorkLog> doInHibernate(Session session) throws HibernateException {
				String hql = "FROM WorkLog WHERE vehicleNo = :vehicleNo";
				Query<WorkLog> query = session.createQuery(hql, WorkLog.class);
				query.setParameter("vehicleNo", vehicleNo);
				return query.list();
			}
		});
	}

	// Garage Nearby Expiry Work Logs (within 1 month)
	public List<WorkLog> getNearbyExpiryWorkLogs(String loggedInGarageContact) {
		List<WorkLog> allLogs = this.getAllWorkLogs();
		List<WorkLog> result = new ArrayList<WorkLog>();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(today);
		calendar.add(Calendar.MONTH, 1);
		Date oneMonthLater = calendar.getTime();

		for (WorkLog log : allLogs) {
			try {
				// Null-safe comparison
				if (loggedInGarageContact == null || !loggedInGarageContact.equals(log.getGarageContact())) {
					continue;
				}

				String dueDateStr = log.getDueDate();
				if (dueDateStr == null || dueDateStr.trim().isEmpty()) {
					continue;
				}

				Date dueDate = sdf.parse(dueDateStr);

				// Check if dueDate is within next 1 month (inclusive)
				if ((dueDate.equals(today) || dueDate.after(today))
						&& (dueDate.before(oneMonthLater) || dueDate.equals(oneMonthLater))) {
					result.add(log);
				}

			} catch (ParseException e) {
				System.out.println("Invalid dueDate format for vehicleNo: " + log.getVehicleNo());
			}
		}

		return result;
	}

	public List<WorkLog> getExpiredWorkLogs(String garageContact) {
		List<WorkLog> allLogs = this.getAllWorkLogs();
		List<WorkLog> result = new ArrayList<WorkLog>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		try {
			Date today = sdf.parse(sdf.format(new Date()));
			for (WorkLog log : allLogs) {
				// Null-safe comparison
				if (garageContact == null || !garageContact.equals(log.getGarageContact())) {
					continue;
				}

				String dueDateStr = log.getDueDate();
				if (dueDateStr != null && !dueDateStr.trim().isEmpty()) {
					Date dueDate = sdf.parse(dueDateStr.trim());
					if (dueDate.before(today)) {
						result.add(log);
					}
				}
			}
		} catch (ParseException e) {
			System.out.println("Error parsing date: " + e.getMessage());
		}

		return result;
	}

	// Get nearby expiry work logs by vehicle number (within 30 days)
	public List<WorkLog> getNearbyExpiryWorkLogsByVehicleNo(String vehicleNo) {
		List<WorkLog> allLogs = this.getAllWorkLogs();
		List<WorkLog> result = new ArrayList<WorkLog>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date today = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(today);
		calendar.add(Calendar.DAY_OF_MONTH, 30);
		Date next30Days = calendar.getTime();

		for (WorkLog log : allLogs) {
			try {
				// Null-safe comparison
				if (vehicleNo == null || !vehicleNo.equals(log.getVehicleNo())) {
					continue;
				}

				String dueDateStr = log.getDueDate();
				if (dueDateStr == null || dueDateStr.trim().isEmpty()) {
					continue;
				}

				Date dueDate = sdf.parse(dueDateStr.trim());

				// Check if dueDate is within next 30 days (inclusive)
				if ((dueDate.equals(today) || dueDate.after(today))
						&& (dueDate.before(next30Days) || dueDate.equals(next30Days))) {
					result.add(log);
				}
			} catch (ParseException e) {
				System.out.println("Invalid dueDate format for vehicleNo: " + log.getVehicleNo());
			}
		}

		return result;
	}
}