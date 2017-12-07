import UIKit

class ViewController: UIViewController {

    let transmitterURL = URL(string: "transmitter://bitte")!

    @IBOutlet var backButton: UIButton!
    @IBOutlet var statusLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        backButton.isEnabled = UIApplication.shared.canOpenURL(transmitterURL)
    }

    func receiveURL(_ url: URL) {
        let payload = url.absoluteString.replacingOccurrences(of: "receiver://", with: "")
        statusLabel.text = "Received \(payload.count) bytes."
    }

    @IBAction func openTransmitter() {
        UIApplication.shared.open(transmitterURL, options: [:])
    }
}
