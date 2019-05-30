package com.actions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.DAO.OaswDao;
import com.dbUtil.DBUtil;
import com.forms.UserMngmentForm;

public class UserManagmentAction extends DispatchAction
{
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	    UserMngmentForm usrMngmtForm =(UserMngmentForm) form;
	    
	    HttpSession session = request.getSession();

		String com=(String) session.getAttribute("companyname");

		usrMngmtForm.setUnit(com);
	    OaswDao.setEmpIdList1(session); 
	    usrMngmtForm.setEmpNameList(OaswDao.getEmpIdList1(session));
		return mapping.findForward("display");
	}
	
	public ActionForward getEmpDetails(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		UserMngmentForm usrMngmtForm =(UserMngmentForm) form;
		String empId = usrMngmtForm.getEmpId();
		String com =   usrMngmtForm.getUnit();
		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String sql = "SELECT EMP_NAME,DESIGNATION,DEPARTMENT FROM EMPLOYEE_MASTER WHERE EMP_ID='"+ empId + "'";
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			usrMngmtForm.setEmpName(rs.getString("EMP_NAME"));
			usrMngmtForm.setDesg(rs.getString("DESIGNATION"));
			usrMngmtForm.setUserRole(rs.getString("DEPARTMENT"));
		}
		HttpSession session = request.getSession();
		usrMngmtForm.setEmpNameList(OaswDao.getEmpIdList(session));
		DBUtil.closeResultSet(rs);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
		return mapping.findForward("display");
	}
	
	public ActionForward addEmpDetails(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException
			 {
	    UserMngmentForm usrMngmtForm =(UserMngmentForm) form;
	    HttpSession session = request.getSession();
		String empId = usrMngmtForm.getEmpId();
		String empName = usrMngmtForm.getEmpName();
		String userName = usrMngmtForm.getUserName();
		String pwd = usrMngmtForm.getPwd();
		String confirmPassword = usrMngmtForm.getConfirmPwd();
		String contactNo = usrMngmtForm.getContactNo();
		String email = usrMngmtForm.getEmailId();
		String designation = usrMngmtForm.getDesg();
		String userRole = usrMngmtForm.getUserRole();
		String createDate = usrMngmtForm.getCreateDate();
		String passwordHint = usrMngmtForm.getPasswordHint();
		String remarks = usrMngmtForm.getRemarks();
		String unit = usrMngmtForm.getUnit();

		Connection con = DBUtil.openConnection();
		Statement stmt = null;
		ResultSet rs = null;
		stmt = con.createStatement();

		try {
			if (pwd.equals(confirmPassword)) {
				String sql = "INSERT INTO USER_MANAGEMENT(EMP_ID,EMP_NAME,USERNAME,PASS_WORD,CONFIRM_PWD,CONTACT_NO,EMAIL_ID,DESIGNATION,USER_TYPE,CREATE_DATE,PWD_HINT,REMARKS,ID,UNIT)VALUES "
						+ " ('"
						+ empId
						+ "','"
						+ empName
						+ "','"
						+ userName
						+ "','"
						+ pwd
						+ "','"
						+ confirmPassword
						+ "','"
						+ contactNo
						+ "','"
						+ email
						+ "','"
						+ designation
						+ "','"
						+ userRole
						+ "',to_date('"
						+ createDate
						+ "','DD/MM/YYYY'),'"
						+ passwordHint + "','" + remarks + "',SEQ_ID.nextval,'"+unit+"')";
				System.out.println("sql isssssssssss--111111111-->" + sql);
				//request.setAttribute("msg1"," Data inserted Successfully");
				try {
					int j = stmt.executeUpdate(sql);
					System.out.println("aaaaaaaaaaaaaaaaa");
					if(j<0)
					{
						request.setAttribute("msg"," Data inserted UnSuccessfully");
					}
					else {
						usrMngmtForm.setEmpId("");
						usrMngmtForm.setEmpName("");
						usrMngmtForm.setUserName("");
						usrMngmtForm.setPwd("");
						usrMngmtForm.setConfirmPwd("");
						usrMngmtForm.setContactNo("");
						usrMngmtForm.setEmailId("");
						usrMngmtForm.setDesg("");
						usrMngmtForm.setUserRole("");
						usrMngmtForm.setCreateDate("");
						usrMngmtForm.setPasswordHint("");
						usrMngmtForm.setRemarks("");
						try {
							String sql1 = "INSERT INTO EMPLOYEES(EMP_ID,EMP_NAME,USERNAME,PASS_WORD,CONTACT_NO,EMAIL_ID,DESIGNATION,USER_TYPE,CREATE_DATE,PWD_HINT,UNIT)VALUES  "
								+ " ('"
								+ empId
								+ "','"
								+ empName
								+ "','"
								+ userName
								+ "','"
								+ pwd
								+ "','"
								+ contactNo
								+ "','"
								+ email
								+ "','"
								+ designation
								+ "','"
								+ userRole
								+ "',to_date('"
								+ createDate
								+ "','DD/MM/YYYY'),'"
								+ passwordHint
								+ "','"+unit+"')";
							int i = 0;
							i = stmt.executeUpdate(sql1);
							if (i > 0) {
/*								usrMngmtForm.setMessage("User Created Successfully");
*/								request.setAttribute("msg1"," Data inserted Successfully");
                                String sql11 ="UPDATE EMPLOYEE_MASTER SET STATUS = '1' WHERE EMP_ID = '"+empId+"' ";
                                rs = stmt.executeQuery(sql11);
                        	    OaswDao.setEmpIdList1(session); 

								} 
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else {
				

				usrMngmtForm.setMessage("The Password and Confirm password you Entered Did not match");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		usrMngmtForm.setEmpNameList(OaswDao.getEmpIdList(session));
		return mapping.findForward("display");
	}
	
	public ActionForward displayUserManagData(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserMngmentForm usrMngmtForm1 =(UserMngmentForm) form;
         
		HttpSession session = request.getSession();
		String com=(String) session.getAttribute("companyname");

		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		String Sql = "SELECT * FROM USER_MANAGEMENT WHERE UNIT = '"+com+"' ORDER BY EMP_ID";
		ArrayList a = new ArrayList();
		UserMngmentForm usrMngmtForm = null;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql);
			while (rs.next()) {
				usrMngmtForm = new UserMngmentForm();
				usrMngmtForm.setEmpId1("Delete:" +rs.getString("EMP_ID"));
				usrMngmtForm.setEmpName1(rs.getString("EMP_NAME"));
				usrMngmtForm.setUserName1(rs.getString("USERNAME"));
				usrMngmtForm.setContactNo1(rs.getString("CONTACT_NO"));
				usrMngmtForm.setEmailId1(rs.getString("EMAIL_ID"));
				usrMngmtForm.setDesg1(rs.getString("DESIGNATION"));
				usrMngmtForm.setUserRole1(rs.getString("USER_TYPE"));
				
				usrMngmtForm.setDate1(rs.getDate("CREATE_DATE"));
				String dt1 = "";
				DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
				dt1 = dateFormat1.format(usrMngmtForm.getDate1());
				usrMngmtForm.setCreateDate1(dt1);
				a.add(usrMngmtForm);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		usrMngmtForm1.setEmpNameList(OaswDao.getEmpIdList(session));
		request.setAttribute("resultsusermanag", a);
		return mapping.findForward("display");
	}
	
	public ActionForward deleteUmRow(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		UserMngmentForm usrMngmtForm =(UserMngmentForm) form;
		String param1 = request.getParameter("empId1");
		String id[] = param1.split(":");
		String empId1 = id[1].trim();

		HttpSession session = request.getSession();
		Connection con = DBUtil.openConnection();
		Statement stmt = null;
		
		String Sql = "DELETE FROM USER_MANAGEMENT WHERE EMP_ID like '" + empId1 + "'";
		stmt = con.createStatement();
		int i = stmt.executeUpdate(Sql);
		if (i > 0) {
			String Sql1 = "DELETE FROM EMPLOYEES WHERE EMP_ID like '" + empId1 + "'";
			stmt = con.createStatement();
			int j = stmt.executeUpdate(Sql1);
			if(j>0){
				System.out.println("success");
			}
			usrMngmtForm.setMessage("Deleted " + i + " rows from User Management Table");
		} else {
			usrMngmtForm.setMessage("No rows Deleted ");
		}
		stmt.close();
		con.close();
		usrMngmtForm.setEmpNameList(OaswDao.getEmpIdList(session));
		return mapping.findForward("display"); 
	}          
}
