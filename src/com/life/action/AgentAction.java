package com.life.action;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.life.form.AgentForm;
import com.object.*;
public class AgentAction extends DispatchAction {

	// 入司资料
	public ActionForward agent_add(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		AgentForm agentForm = (AgentForm) form;
		Staff agent = agentForm.getAgent();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		String str = agent.agent_add(agent, s);
		if (agent.getC_jobnm().equals("add")) {
			ActionForward af = new ActionForward();
			af.setPath("/agent/entry/add4.jsp?c_orgid="+agent.getC_orgid()+"&c_jobnumber=" + str);
			return af;
		} else {
			return mapping.findForward("success");
		}
	}
	//	 修改机构
	public ActionForward agent_org(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		AgentForm agentForm = (AgentForm) form;
		Staff agent = agentForm.getAgent();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		agent.agent_org(agent, s);
		return mapping.findForward("success");
	}
	//	 离司人员恢复工号
	public ActionForward agent_back(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		AgentForm agentForm = (AgentForm) form;
		Staff agent = agentForm.getAgent();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		agent.agent_back(agent, s);
		return mapping.findForward("success");
	}
	// 血缘关系
	public ActionForward agent_relation(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		AgentForm agentForm = (AgentForm) form;
		Staff agent = agentForm.getAgent();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		agent.agent_relation(agent, s);
		return mapping.findForward("success");
	} 
	//职级变动
	public ActionForward agent_zjbd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		AgentForm agentForm = (AgentForm) form;
		Staff agent = agentForm.getAgent();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		agent.agent_zjbd(agent, s);
		return mapping.findForward("success");
	} 	 
	//佣金计算
	public ActionForward commission(ActionMapping mapping, ActionForm form, 
			HttpServletRequest request, HttpServletResponse response)
		throws SQLException	{
			AgentForm agentForm = (AgentForm) form;
			Commission commission = agentForm.getCommission();
			Staff s=(Staff)request.getSession().getAttribute("Staff");
			commission.agentcommission(commission, s); 
			return mapping.findForward("success");
	}	
	//离司
	public ActionForward agent_ls(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		AgentForm agentForm = (AgentForm) form;
		Staff agent = agentForm.getAgent();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		agent.agent_ls(agent, s);
		return mapping.findForward("success");
	} 	
 
}
