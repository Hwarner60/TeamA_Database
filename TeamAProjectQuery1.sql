SELECT the_schedule.emp_id, employee.emp_name, store.store_id
FROM the_schedule
INNER JOIN employee
ON the_schedule.emp_id = employee.emp_id
INNER JOIN store
ON the_schedule.store_id = store.store_id

/* Query to find out Employee schedule*/