package avliscraftgrails

class WorldController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [worldInstanceList: World.list(params), worldInstanceTotal: World.count()]
    }

    def create = {
        def worldInstance = new World()
        worldInstance.properties = params
        return [worldInstance: worldInstance]
    }

    def save = {
        def worldInstance = new World(params)
        if (worldInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'world.label', default: 'World'), worldInstance.id])}"
            redirect(action: "show", id: worldInstance.id)
        }
        else {
            render(view: "create", model: [worldInstance: worldInstance])
        }
    }

    def show = {
        def worldInstance = World.get(params.id)
        if (!worldInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])}"
            redirect(action: "list")
        }
        else {
            [worldInstance: worldInstance]
        }
    }

    def edit = {
        def worldInstance = World.get(params.id)
        if (!worldInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [worldInstance: worldInstance]
        }
    }

    def update = {
        def worldInstance = World.get(params.id)
        if (worldInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (worldInstance.version > version) {
                    
                    worldInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'world.label', default: 'World')] as Object[], "Another user has updated this World while you were editing")
                    render(view: "edit", model: [worldInstance: worldInstance])
                    return
                }
            }
            worldInstance.properties = params
            if (!worldInstance.hasErrors() && worldInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'world.label', default: 'World'), worldInstance.id])}"
                redirect(action: "show", id: worldInstance.id)
            }
            else {
                render(view: "edit", model: [worldInstance: worldInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def worldInstance = World.get(params.id)
        if (worldInstance) {
            try {
                worldInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'world.label', default: 'World'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'world.label', default: 'World'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])}"
            redirect(action: "list")
        }
    }
}
