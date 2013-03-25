
<%@ page import="avliscraftgrails.Recipe" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="recipe.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="recipe.ingredients.label" default="Ingredients" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${recipeInstance.ingredients}" var="i">
                                    <li><g:link controller="ingredient" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="recipe.level.label" default="Level" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "level")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="recipe.confirmed.label" default="Confirmed" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${recipeInstance?.confirmed}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="recipe.skill.label" default="Skill" /></td>
                            
                            <td valign="top" class="value"><g:link controller="skill" action="show" id="${recipeInstance?.skill?.id}">${recipeInstance?.skill?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="recipe.item.label" default="Item" /></td>
                            
                            <td valign="top" class="value"><g:link controller="item" action="show" id="${recipeInstance?.item?.id}">${recipeInstance?.item?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="recipe.quantity.label" default="Quantity" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "quantity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="recipe.user.label" default="User" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${recipeInstance?.user?.id}">${recipeInstance?.user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="recipe.world.label" default="World" /></td>
                            
                            <td valign="top" class="value"><g:link controller="world" action="show" id="${recipeInstance?.world?.id}">${recipeInstance?.world?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${recipeInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
