
<%@ page import="avliscraftgrails.Char" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'char.label', default: 'Char')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${charInstance}">
            <div class="errors">
                <g:renderErrors bean="${charInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="char.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: charInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${charInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="char.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: charInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${avliscraftgrails.User.list()}" optionKey="id" value="${charInstance?.user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="world"><g:message code="char.world.label" default="World" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: charInstance, field: 'world', 'errors')}">
                                    <g:select name="world.id" from="${avliscraftgrails.World.list()}" optionKey="id" value="${charInstance?.world?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>