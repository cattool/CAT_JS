<%-- 
    Copyright 2012, 2013 University of Saskatchewan

    This file is part of the Curriculum Alignment Tool (CAT).

    CAT is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    CAT is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with CAT.  If not, see <http://www.gnu.org/licenses/>.
--%>


<%@ page import="java.util.*,ca.usask.gmcte.currimap.action.*,ca.usask.gmcte.currimap.model.*,ca.usask.gmcte.util.*,org.apache.log4j.*"%> 
<%!Logger logger = Logger.getLogger("organizations.jsp"); %> 
<%
Boolean sessionValue = (Boolean)session.getAttribute("userIsSysadmin");
boolean sysadmin = sessionValue != null && sessionValue;
//TreeMap<Organization, ArrayList<Organization>> map = OrganizationManager.instance().getOrganizationsOrderedByName();
List<Organization> list = OrganizationManager.instance().getParentOrganizationsOrderedByName(true);
for(Organization o : list)
{
	%>
	<div id="Organization_<%=o.getId()%>">
		<jsp:include page="organization.jsp">
			<jsp:param name="organization_id" value="<%=o.getId()%>" />
		</jsp:include>
	</div>
	<%
}
%>
<hr/>
<%

if(sysadmin) {%><a href="javascript:loadModify('/cat/auth/modifySystem/organization.jsp');" class="smaller"><img src="/cat/images/add_24.gif" style="height:14pt;" alt="Add organization" title="Add organization"> Add an Organization</a><%}%>





