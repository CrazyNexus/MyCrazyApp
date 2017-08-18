//
// AppDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//

import SAPFiori
import SAPFoundation

import SAPCommon

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    private let logger: Logger = Logger.shared(named: "AppDelegateLogger")
    var northwindEntities: NorthwindEntitiesDataAccess!
    var urlSession: SAPURLSession? {
        didSet {
            self.northwindEntities = NorthwindEntitiesDataAccess(urlSession: urlSession!)
            self.uploadLogs()
        }
    }

    func applicationDidFinishLaunching(_ application: UIApplication) {

        // set the default log level. Note: LogLevel.all may be too much for your use case! Maybe prefer LogLevel.error.
        Logger.root.logLevel = LogLevel.debug

        do {
            // Attaches a LogUploadFileHandler instance to the root of the logging system.d
            try SAPcpmsLogUploader.attachToRootLogger()
        } catch {
            self.logger.error("Failed to attach to root logger.", error: error)
        }

        UINavigationBar.applyFioriStyle()

        // Override point for customization after application launch.
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count - 1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self

        // Show the actual authentication' view controller
        self.window?.makeKeyAndVisible()
        let storyboard: UIStoryboard? = UIStoryboard(name: "Main", bundle: nil)
        if (storyboard != nil) {
            let splitViewController = self.window!.rootViewController as! UISplitViewController
            let logonViewController = (storyboard?.instantiateViewController(withIdentifier: "BasicAuth"))! as! BasicAuthViewController
            splitViewController.modalPresentationStyle = UIModalPresentationStyle.currentContext
            splitViewController.preferredDisplayMode = .allVisible
            splitViewController.present(logonViewController, animated: false, completion: {})
        }
    }

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsMasterController = secondaryAsNavController.topViewController as? MasterViewController else { return false }
        // Without this, on iPhone the main screen is the detailview and the masterview can not be reached.
        if (topAsMasterController.collectionType == .none) {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }

        return false
    }

    // This function is invoked on every application start, but you can reuse it to manually triger the logupload.
    private func uploadLogs() {
        guard let sapUrlSession = self.urlSession else {
            return
        }
        let sapcpmsConfigurationParameters = SAPcpmsSettingsParameters(backendURL: Constants.sapcpmsUrl, applicationID: Constants.appId)
        SAPcpmsLogUploader.uploadLogs(sapURLSession: sapUrlSession, settingsParameters: sapcpmsConfigurationParameters, completionHandler: { error in
            if let error = error {

                self.logger.error("Error happened during log upload.", error: error)
                return
            }

            self.logger.info("Logs have been uploaded successfully.")
        })
    }
}
