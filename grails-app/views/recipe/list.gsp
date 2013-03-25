
<%@ page import="avliscraftgrails.Recipe" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'recipe.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="level" title="${message(code: 'recipe.level.label', default: 'Level')}" />
                        
                            <g:sortableColumn property="confirmed" title="${message(code: 'recipe.confirmed.label', default: 'Confirmed')}" />
                        
                            <th><g:message code="recipe.skill.label" default="Skill" /></th>
                   	    
                            <th><g:message code="recipe.item.label" default="Item" /></th>
                   	    
                            <g:sortableColumn property="quantity" title="${message(code: 'recipe.quantity.label', default: 'Quantity')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${recipeInstanceList}" status="i" var="recipeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${recipeInstance.id}">${fieldValue(bean: recipeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: recipeInstance, field: "level")}</td>
                        
                            <td><g:formatBoolean boolean="${recipeInstance.confirmed}" /></td>
                        
                            <td>${fieldValue(bean: recipeInstance, field: "skill")}</td>
                        
                            <td>${fieldValue(bean: recipeInstance, field: "item")}</td>
                        
                            <td>${fieldValue(bean: recipeInstance, field: "quantity")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${recipeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
