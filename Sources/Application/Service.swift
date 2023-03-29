import BluetoothHCI
import BluetoothLinux

class Service {
    func execute() async throws {
        guard let controller = await HostController.default else { return }
        do { try await controller.enableLowEnergyAdvertising(false, timeout: .default) }
        catch HCIError.commandDisallowed { }
        
        let parameters = HCILESetAdvertisingParameters.init(interval: (min: AdvertisingInterval.init(rawValue: 100)!, max: AdvertisingInterval.init(rawValue: 5000)!),
                                                            advertisingType: .directed,
                                                            ownAddressType: .public,
                                                            directAddresssType: .public,
                                                            directAddress: .zero,
                                                            channelMap: .all,
                                                            filterPolicy: .any)
        try await controller.deviceRequest(parameters, timeout: .default)
        do { try await controller.enableLowEnergyAdvertising(true, timeout: .default) }
        catch HCIError.commandDisallowed { }
        print(controller)
    }
}
