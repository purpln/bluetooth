struct Core {
    var application: any Application
    
    private var executing: Bool = true
    
    mutating func execute() async {
        repeat {
            switch await application.scene.process() {
            case -1: executing = false
            case 1: executing = false
            default: break
            }
        } while executing
    }
    
    init<T>(_ t: T.Type) where T: Application {
        application = T()
    }
}
