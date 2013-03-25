
<%@ page import="avliscraftgrails.Ingredient" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ingredient.label', default: 'Ingredient')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ingredientInstance}">
            <div class="errors">
                <g:renderErrors bean="${ingredientInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${ingredientInstance?.id}" />
                <g:hiddenField name="version" value="${ingredientInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="recipe"><g:message code="ingredient.recipe.label" default="Recipe" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredientInstance, field: 'recipe', 'errors')}">
                                    <g:select name="recipe.id" from="${avliscraftgrails.Recipe.list()}" optionKey="id" value="${ingredientInstance?.recipe?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="item"><g:message code="ingredient.item.label" default="Item" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredientInstance, field: 'item', 'errors')}">
                                    <g:select name="item.id" from="${avliscraftgrails.Item.list()}" optionKey="id" value="${ingredientInstance?.item?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="quantity"><g:message code="ingredient.quantity.label" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredientInstance, field: 'quantity', 'errors')}">
                                    <g:textField name="quantity" value="${fieldValue(bean: ingredientInstance, field: 'quantity')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
