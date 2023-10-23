import Foundation
import PackagePlugin

@main struct DummyPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        return [
            // this plugin does nothing
        ]
    }
}
