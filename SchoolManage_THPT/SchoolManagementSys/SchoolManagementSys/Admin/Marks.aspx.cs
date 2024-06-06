using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSys.Models.SchoolCS;

namespace SchoolManagementSys.Admin
{
    public partial class Marks : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClaass();
                GetMarks();
            }
        }

        private void GetMarks()
        {
            DataTable dt = fn.Fetch(@"Select ROW_NUMBER() over (Order by (Select 1)) as [Sr.No], e.ExamId, e.ClassId, c.ClassName, e.SubjectId, s.SubjectName,
                                      e.RollNo, e.TotalMarks, e.OutOfMarks from Exam e inner join Class c on e.ClassId = c.ClassId 
                                        inner join Subject s on e.SubjectId = s.SubjectId ");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void GetClaass()
        {
            DataTable dt = fn.Fetch("Select * from Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            //ClaasId trong sql bảng clasa
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Chọn lớp học");
        }

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string classId = ddlClass.SelectedValue;
            DataTable dt = fn.Fetch("Select * from Subject where ClassId = '" + classId + "' ");
            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SubjectName";
            //ClaasId trong sql bảng clasa
            ddlSubject.DataValueField = "SubjectId";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, "Chọn môn học");
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classId = ddlClass.SelectedValue;
                string subjectId = ddlSubject.SelectedValue;
                string rollNo = txtRoll.Text.Trim();
                string studMarks = txtStudMarks.Text.Trim();
                string outOfMarks = txtOutOfMarks.Text.Trim();

                DataTable dttbl = fn.Fetch("Select StudentId from Student where ClassId = '" + classId + "' and RollNo = '" + rollNo + "' ");

                if(dttbl.Rows.Count > 0)
                {
                    DataTable dt = fn.Fetch("Select * from Exam where ClassId = '" + classId + "' and SubjectId = '" + subjectId + "' and RollNo = '" + rollNo + "' ");

                    if (dt.Rows.Count == 0)
                    {
                        string query = "Insert into Exam values('" + classId + "' ,'" + subjectId + "', '" + rollNo + "', '" + studMarks + "', '" + outOfMarks + "' )";
                        fn.Query(query);
                        lblMsg.Text = "Đã chèn thành công!!!";
                        lblMsg.CssClass = "alert alert-success";
                        ddlClass.SelectedIndex = 0;
                        ddlSubject.SelectedIndex = 0;
                        txtRoll.Text = string.Empty;
                        txtStudMarks.Text = string.Empty;
                        txtOutOfMarks.Text = string.Empty;

                        GetMarks();

                    }
                    else
                    {
                        lblMsg.Text = "Dữ liệu đã tồn tại!!! ";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                } 
                else
                {
                    lblMsg.Text = "  Số báo danh <b>" + rollNo+ " không tồn tại cho lớp đã chọn!!! ";
                    lblMsg.CssClass = "alert alert-danger";
                }

                

            }
            catch (Exception ex)
            {
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int ExamId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Exam where ExamId = '" + ExamId + "' ");
                lblMsg.Text = "Điểm đã xóa thành công!!!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetMarks();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetMarks() ;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetMarks() ;
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetMarks() ;
        }
        
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int examId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string classId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlClassGv")).SelectedValue;
                string subjectId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlSubjectGv")).SelectedValue;
                string rollNo = (row.FindControl("txtRollNoGv") as TextBox).Text.Trim();
                string studMarks = (row.FindControl("txtStudMarksGv") as TextBox).Text.Trim();
                string outOfMarks = (row.FindControl("txtOutOfMarksGv") as TextBox).Text.Trim();


                fn.Query(@"Update Exam set ClassId = '" + classId + "', SubjectId = '" + subjectId + "', RollNo = '" + rollNo +
                    "', TotalMarks = '" + studMarks + "' , OutOfMarks = '" +outOfMarks + "' where ExamId = '" + examId + "' ");
                lblMsg.Text = "Cập nhật bản ghi thành công!!!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetMarks();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClassGv");
                    DropDownList ddlSubject = (DropDownList)e.Row.FindControl("ddlSubjectGv");
                    DataTable dt = fn.Fetch("Select * from Subject where ClassId = '" + ddlClass.SelectedValue + "' ");
                    ddlSubject.DataSource = dt;
                    ddlSubject.DataTextField = "SubjectName";
                    ddlSubject.DataValueField = "SubjectId";
                    ddlSubject.DataBind();
                    ddlSubject.Items.Insert(0, "Chọn môn học");
                    string selectedSubject = DataBinder.Eval(e.Row.DataItem, "SubjectName").ToString();
                    ddlSubject.Items.FindByText(selectedSubject).Selected = true;

                }
            }
        }

        protected void ddlClassGv_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlClassSelected = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlClassSelected.NamingContainer;
            if (row != null)
            {
                if ((row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlSubjectGV = (DropDownList)row.FindControl("ddlSubjectGv");
                    DataTable dt = fn.Fetch("Select * from Subject where ClassId = '" + ddlClassSelected.SelectedValue + "' ");
                    ddlSubjectGV.DataSource = dt;
                    ddlSubjectGV.DataTextField = "SubjectName";
                    ddlSubjectGV.DataValueField = "SubjectId";
                    ddlSubjectGV.DataBind();


                }
            }
        }

      
    }
}