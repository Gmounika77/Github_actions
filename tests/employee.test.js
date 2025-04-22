
const {
  isValidEmployee,
  calculateBonus,
  formatEmployeeInfo
} = require('../src/employee');

describe('Employee Utilities', () => {
  const validEmployee = { name: 'Alice', salary: 60000 };

  test('validates a correct employee', () => {
    expect(isValidEmployee(validEmployee)).toBe(true);
  });

  test('invalid employee with no name', () => {
    expect(isValidEmployee({ salary: 50000 })).toBe(false);
  });

  test('calculate bonus correctly', () => {
    expect(calculateBonus(validEmployee, 10)).toBe(6000);
  });

  test('throws error for invalid employee in bonus calc', () => {
    expect(() => calculateBonus({ name: 'Bob' }, 10)).toThrow('Invalid employee');
  });

  test('formats employee info', () => {
    expect(formatEmployeeInfo(validEmployee)).toBe('Alice earns $60000.00 per year.');
  });
});


