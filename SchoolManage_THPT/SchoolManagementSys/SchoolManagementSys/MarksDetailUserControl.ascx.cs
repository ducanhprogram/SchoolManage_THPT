﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSys.Models.SchoolCS;

namespace SchoolManagementSys
{
    public partial class MarksDetailUserControl : System.Web.UI.UserControl
    {
        Commonfnx fn = new Commonfnx();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                GetMarks();
            }
        }

        private void GetMarks()
        {
            DataTable dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY(Select 1))  as [Sr.No], e.ExamId, e.ClassId, c.ClassName, 
                                        e.SubjectId, s.SubjectName, e.RollNo, e.TotalMarks, e.OutOfMarks from Exam e 
                                        inner join Class c on c.ClassId = e.ClassId inner join Subject s on s.SubjectId = e.SubjectId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select * from Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            //ClaasId trong sql bảng clasa
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Chọn lớp học");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classId = ddlClass.SelectedValue;
                string rollNo = txtRoll.Text.Trim();
                DataTable dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY(Select 1))  as [Sr.No], e.ExamId, e.ClassId, c.ClassName, 
                                        e.SubjectId, s.SubjectName, e.RollNo, e.TotalMarks, e.OutOfMarks from Exam e 
                                        inner join Class c on c.ClassId = e.ClassId inner join Subject s on s.SubjectId = e.SubjectId 
                                        where e.ClassId = '" + classId + "' and e.RollNo = '" + rollNo + "'   ");
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;

        }
    }
}