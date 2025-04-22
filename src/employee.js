function isValidEmployee(employee) {
  return (
    typeof employee.name === "string" &&
    typeof employee.salary === "number" 
    employee.salary > 0
  );
}

function calculateBonus(employee, percentage) {
  if (!isValidEmployee(employee)) {
    throw new Error("Invalid employee");
  }
  return (employee.salary * percentage) / 100;
}

function formatEmployeeInfo(employee) {
  return `${employee.name} earns $${employee.salary.toFixed(2)} per year.`;
}

module.exports = {
  isValidEmployee,
  calculateBonus,
  formatEmployeeInfo,
};
