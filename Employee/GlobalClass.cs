using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Employee
{
    public class GlobalClass
    {
        static int EmpId;
        static string panCard;

        //Opening connection with DB and return SqlCommand obj
        private SqlCommand OpenConnection(string strsql)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["cnstr"]);
            sqlConnection.Open();

            //checking connection to open
            if (sqlConnection != null && sqlConnection.State == ConnectionState.Closed)
            {
                throw new Exception("Not connecting to database");
            }

            SqlCommand sqlCommand = new SqlCommand(strsql, sqlConnection);

            return sqlCommand;
        }

        //function to change password
        public bool UpdatePassword(string username, string password, string newPassword)
        {
            string strsql = "update UserLogin set Passwd='" + newPassword + "' where UserName='" + username + "' and Passwd='" + password + "'";
            if (runNonQuery(strsql))
                return true;
            else
                return false;
        }

        //function to check user login
        public bool CheckEmployeeLogin(string uname, string pass)
        {
            if (uname == "admin" && pass == "admin")
            {
                return true;
            }
            else
            {
                string sqlstr = "select * from Userlogin where UserName='" + uname + "'and Passwd='" + pass + "'";
                SqlCommand sqlCommand = OpenConnection(sqlstr);
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                bool loginStatus = false;

                if (sqlDataReader.Read())
                {
                    loginStatus = true;
                }

                return loginStatus;
            }

        }

        //function to get employee id
        public int GetEmpID(string panCard)
        {
            string sqlstr = "select EmpId from Employees where panCard='" + panCard + "'";
            SqlCommand sqlCommand = OpenConnection(sqlstr);
            SqlDataReader dataReader = sqlCommand.ExecuteReader();

            //taking EmpId of registered employees -for store it ito the login table- requires to fetch particular Emp data
            while (dataReader.Read())
            {
                EmpId = int.Parse(dataReader[0].ToString());
            }

            return EmpId;
        }
        public int GetEmpId(string username)
        {
            int empid = 0;
            string sqlstr = "select EnpID from Userlogin where UserName='" + username + "'";
            SqlCommand sqlCommand = OpenConnection(sqlstr);
            SqlDataReader dataReader = sqlCommand.ExecuteReader();

            //taking EmpId of registered employees -for store it ito the login table- requires to fetch particular Emp data
            while (dataReader.Read())
            {
                empid = int.Parse(dataReader[0].ToString());
            }

            return empid;
        }

        //getting dept name for showing only data of same dept of logged in emp
        public string GetDeptName(string empId)
        {
            string deptid = "";
            string deptname = "";
            string sqlstr = "select DeptId from Userlogin where EnpID="+ empId + "";
            SqlCommand sqlCommand = OpenConnection(sqlstr);
            SqlDataReader dataReader = sqlCommand.ExecuteReader();

            while (dataReader.Read())
            {
                deptid = dataReader[0].ToString();
            }
            //taking dept name
            string sqlstr1 = "select DeptName from Department where DeptId="+ deptid + "";
            SqlCommand sqlCommand1 = OpenConnection(sqlstr1);
            SqlDataReader dataReader1 = sqlCommand1.ExecuteReader();

            while (dataReader1.Read())
            {
                deptname = dataReader1[0].ToString();
            }
            return deptname;

        }
        //function to get pancard information
        public string GetPanCard(string username)
        {
            string sqlstr = "select e.PanCard from Employees e, Userlogin u where e.EmpId=u.EnpID and u.UserName='" + username + "'";
            SqlCommand sqlCommand = OpenConnection(sqlstr);
            SqlDataReader dataReader = sqlCommand.ExecuteReader();

            //taking EmpId of registered employees -for store it ito the login table- requires to fetch particular Emp data
            while (dataReader.Read())
            {
                panCard = dataReader[0].ToString();
            }
            return panCard;
        }

        //function to check already present user
        public bool CheckPresentUserToRegister(string username)
        {
            string sqlstr = "select UserName from Userlogin";
            SqlCommand sqlCommand = OpenConnection(sqlstr);
            SqlDataReader dataReader = sqlCommand.ExecuteReader();

            //taking EmpId of registered employees -for store it ito the login table- requires to fetch particular Emp data
            while (dataReader.Read())
            {
                if (dataReader[0].ToString() == username)
                    return false; //if emp present return false
            }
            return true; //is emp is not already present then we can add
        }

        //function to insert data of registration
        public bool InsertEmpData(string uName, string pass, string empName, string email, string mobile, string panCard, int age, string deptName)
        {
            int deptId = 0;
            if (deptName == "Sales")
                deptId = 9;
            else if (deptName == "IT")
                deptId = 10;
            else if (deptName == "HR")
                deptId = 11;
            else
                deptId = 12;
            //inserting to employees
            string strsql = "insert into Employees values('" + empName + "','" + email + "','" + mobile + "','" + panCard + "'," + age + "," + deptId + ")";
            SqlCommand sqlCommand = OpenConnection(strsql);
            sqlCommand.ExecuteNonQuery();

            int empId = GetEmpID(panCard);

            //inserting to userLogin
            string sqlstr2 = "insert into Userlogin values(" + EmpId + ",'" + uName + "','" + pass + "'," + deptId + ")";
            SqlCommand sqlCommand1 = OpenConnection(sqlstr2);
            sqlCommand1.ExecuteNonQuery();
            return true;
        }

        //ExecuteNonQuery for insert, update, delete operation- OR- want no data 
        public bool runNonQuery(string strsql)
        {
            SqlCommand sqlCommand = OpenConnection(strsql);
            int result = sqlCommand.ExecuteNonQuery(); //returns zero is not executed successfully

            if (result == 0)
                return false;
            else
                return true;
        }

        //function to fill data into table for showing in employess display page
        private DataSet FillDataInTable(SqlCommand sqlCommand)
        {
            DataSet dataSet = new DataSet();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(dataSet, "dt");
            return dataSet;
        }

        //showing to employee page
        public DataSet ShowEmpData(string username, string passwd)
        {
            DataSet dataSet = new DataSet();
            string sqlstr = null;
            if (username != "admin")
            {
                string pancard = GetPanCard(username);
                sqlstr = "select d.DeptId,d.DeptName,e.EmpID,e.EmpName,e.EmailID,e.Mobile,e.PanCard,e.Age from Department d, Employees e where e.DeptId = d.DeptId and e.PanCard = '" + pancard + "'";
                SqlCommand sqlCommand = OpenConnection(sqlstr);
                dataSet = FillDataInTable(sqlCommand);
                return dataSet;
            }
            if (username == "admin" && passwd == "admin")
            {
                string sqlstr1 = "select d.DeptId,d.DeptName,e.EmpID,EmpName,e.EmailID,e.Mobile,e.PanCard from Department d inner join Employees e on d.DeptId=e.DeptId order by e.EmpName";
                SqlCommand sqlCommand = OpenConnection(sqlstr1);
                dataSet = FillDataInTable(sqlCommand);
                return dataSet;
            }
            return dataSet;
        }

        //Employees comes under same dept
        public DataSet ShowEmpDataWithSameDept(string deptname)
        {
            DataSet dataSet = new DataSet();
            string sqlstr = null;
            sqlstr = "select d.DeptId,d.DeptName,e.EmpID,e.EmpName,e.EmailID,e.Mobile,e.PanCard,e.Age from Department d,Employees e where e.DeptId=d.DeptId and d.DeptName='"+ deptname + "'";
            SqlCommand sqlCommand = OpenConnection(sqlstr);
            dataSet = FillDataInTable(sqlCommand);
            return dataSet;
        }

        //showing all emp data
        public DataSet ShowAllEmpData()
        {
            DataSet dataSet = new DataSet();
            string sqlstr = null;
            sqlstr = "select d.DeptId,d.DeptName,e.EmpID,e.EmpName,e.EmailID,e.Mobile,e.PanCard,e.Age from Department d,Employees e where e.DeptId=d.DeptId order by d.DeptId";
            SqlCommand sqlCommand = OpenConnection(sqlstr);
            dataSet = FillDataInTable(sqlCommand);
            return dataSet;
        }

        //update employee information
        public void UpdateEmpInfo(string empName,string emailID, string mobile, string panCard, int age, string deptName, int empId)
        {
            int deptId = 0;
            if (deptName == "Sales")
                deptId = 9;
            else if (deptName == "IT")
                deptId = 10;
            else if (deptName == "HR")
                deptId = 11;
            else
                deptId = 12;
            
            string strsql = "update Employees set EmpName='" + empName + "',EmailID='" + emailID + "',Mobile='" + mobile + "',PanCard='" + panCard + "',Age=" + age + ",DeptId="+ deptId + " where EmpID=" + empId + "";
            runNonQuery(strsql);
        }
    }
}