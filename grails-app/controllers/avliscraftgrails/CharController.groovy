package avliscraftgrails

class CharController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [charInstanceList: Char.list(params), charInstanceTotal: Char.count()]
    }

    def create = {
        def charInstance = new Char()
        charInstance.properties = params
        return [charInstance: charInstance]
    }

    def save = {
        def charInstance = new Char(params)
        if (charInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'char.label', default: 'Char'), charInstance.id])}"
            redirect(action: "show", id: charInstance.id)
        }
        else {
            render(view: "create", model: [charInstance: charInstance])
        }
    }

    def show = {
        def charInstance = Char.get(params.id)
        if (!charInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'char.label', default: 'Char'), params.id])}"
            redirect(action: "list")
        }
        else {
            [charInstance: charInstance]
        }
    }

    def edit = {
        def charInstance = Char.get(params.id)
        if (!charInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'char.label', default: 'Char'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [charInstance: charInstance]
        }
    }

    def update = {
        def charInstance = Char.get(params.id)
        if (charInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (charInstance.version > version) {
                    
                    charInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'char.label', default: 'Char')] as Object[], "Another user has updated this Char while you were editing")
                    render(view: "edit", model: [charInstance: charInstance])
                    return
                }
            }
            charInstance.properties = params
            if (!charInstance.hasErrors() && charInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'char.label', default: 'Char'), charInstance.id])}"
                redirect(action: "show", id: charInstance.id)
            }
            else {
                render(view: "edit", model: [charInstance: charInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'char.label', default: 'Char'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def charInstance = Char.get(params.id)
        if (charInstance) {
            try {
                charInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'char.label', default: 'Char'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'char.label', default: 'Char'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'char.label', default: 'Char'), params.id])}"
            redirect(action: "list")
        }
    }
}
