public protocol Application {
    associatedtype Content: Scene
    var scene: Content { get }
    
    init()
    static func main() async
}

extension Application {
    public static func main() async {
        var core = Core(Self.self)
        await core.execute()
    }
}
