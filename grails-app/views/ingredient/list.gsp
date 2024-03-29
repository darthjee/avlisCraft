
<%@ page import="avliscraftgrails.Ingredient" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ingredient.label', default: 'Ingredient')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'ingredient.id.label', default: 'Id')}" />
                        
                            <th><g:message code="ingredient.recipe.label" default="Recipe" /></th>
                   	    
                            <th><g:message code="ingredient.item.label" default="Item" /></th>
                   	    
                            <g:sortableColumn property="quantity" title="${message(code: 'ingredient.quantity.label', default: 'Quantity')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ingredientInstanceList}" status="i" var="ingredientInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ingredientInstance.id}">${fieldValue(bean: ingredientInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: ingredientInstance, field: "recipe")}</td>
                        
                            <td>${fieldValue(bean: ingredientInstance, field: "item")}</td>
                        
                            <td>${fieldValue(bean: ingredientInstance, field: "quantity")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ingredientInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
