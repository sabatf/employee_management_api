class EmployeesController < ApplicationController
  before_action :set_employee

  # GET /employees
  def index
    @employees = Employee.all.order('start_date')
    json_response(@employees)
  end

  # POST /employees
  def create
    @employee = Employee.create!(employee_params)
    json_response(@employee, :created)
  end

  # GET /employees/:id
  def show
    json_response(@employee)
  end

  # PUT /employees/:id
  def update
    @employee.update(employee_params)
    head :no_content
  end

  # DELETE /employees/:id
  def destroy
    @employee.destroy
    head :no_content
  end


  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

end
