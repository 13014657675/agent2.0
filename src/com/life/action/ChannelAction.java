package com.life.action; 
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction; 
import com.life.form.ChannelForm;
import com.object.*; 
public class ChannelAction extends DispatchAction
{	 
	//	 �������
	public ActionForward outlets(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		ChannelForm channelForm = (ChannelForm) form;
		Bankoutlets bankoutlets = channelForm.getBankoutlets();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		bankoutlets.add_update_delete(bankoutlets, s);
		return mapping.findForward("success");
	} 
	//	 �������
	public ActionForward bankrelate(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		ChannelForm channelForm = (ChannelForm) form;
		Bankoutlets bankoutlets = channelForm.getBankoutlets();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		bankoutlets.bankrelate(bankoutlets, s);
		return mapping.findForward("success");
	} 
	//	 ��˾����
	public ActionForward agent_add(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		ChannelForm channelForm = (ChannelForm) form;
		Staff agent = channelForm.getAgent();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		String str = agent.agent_add(agent, s);
		if (agent.getC_jobnm().equals("add")) {
			ActionForward af = new ActionForward();
			af.setPath("/channel/entry/add4.jsp?c_orgid="+agent.getC_orgid()+"&c_jobnumber=" + str);
			return af;
		} else {
			return mapping.findForward("success");
		}
	}
	//	 �޸Ļ���
	public ActionForward agent_org(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		ChannelForm channelForm = (ChannelForm) form;
		Staff agent = channelForm.getAgent();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		agent.agent_org(agent, s);
		return mapping.findForward("success");
	}
	//	 ��˾��Ա�ָ�����
	public ActionForward agent_back(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		ChannelForm channelForm = (ChannelForm) form;
		Staff agent = channelForm.getAgent();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		agent.agent_back(agent, s);
		return mapping.findForward("success");
	}
	// ѪԵ��ϵ
	public ActionForward agent_relation(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		ChannelForm channelForm = (ChannelForm) form;
		Staff agent = channelForm.getAgent();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		agent.agent_relation(agent, s);
		return mapping.findForward("success");
	} 	
	//	ְ���䶯
	public ActionForward agent_zjbd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		ChannelForm channelForm = (ChannelForm) form;
		Staff agent = channelForm.getAgent();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		agent.agent_zjbd(agent, s);
		return mapping.findForward("success");
	} 	 
	//��˾
	public ActionForward agent_ls(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		ChannelForm channelForm = (ChannelForm) form;
		Staff agent = channelForm.getAgent();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		agent.agent_ls(agent, s);
		return mapping.findForward("success");
	} 	
}
