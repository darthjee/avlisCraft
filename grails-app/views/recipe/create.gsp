
<%@ page import="avliscraftgrails.Recipe" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
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
            <g:hasErrors bean="${recipeInstance}">
            <div class="errors">
                <g:renderErrors bean="${recipeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="level"><g:message code="recipe.level.label" default="Level" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipeInstance, field: 'level', 'errors')}">
                                    <g:textField name="level" value="${fieldValue(bean: recipeInstance, field: 'level')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="confirmed"><g:message code="recipe.confirmed.label" default="Confirmed" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipeInstance, field: 'confirmed', 'errors')}">
                                    <g:checkBox name="confirmed" value="${recipeInstance?.confirmed}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="skill"><g:message code="recipe.skill.label" default="Skill" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipeInstance, field: 'skill', 'errors')}">
                                    <g:select name="skill.id" from="${avliscraftgrails.Skill.list()}" optionKey="id" value="${recipeInstance?.skill?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="item"><g:message code="recipe.item.label" default="Item" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipeInstance, field: 'item', 'errors')}">
                                    <g:select name="item.id" from="${avliscraftgrails.Item.list()}" optionKey="id" value="${recipeInstance?.item?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantity"><g:message code="recipe.quantity.label" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipeInstance, field: 'quantity', 'errors')}">
                                    <g:textField name="quantity" value="${fieldValue(bean: recipeInstance, field: 'quantity')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="recipe.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipeInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${avliscraftgrails.User.list()}" optionKey="id" value="${recipeInstance?.user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="world"><g:message code="recipe.world.label" default="World" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipeInstance, field: 'world', 'errors')}">
                                    <g:select name="world.id" from="${avliscraftgrails.World.list()}" optionKey="id" value="${recipeInstance?.world?.id}"  />
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
