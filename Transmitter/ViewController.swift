import UIKit

class ViewController: UIViewController {

    var dataSize = 1

    @IBOutlet var button: UIButton!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var slider: UISlider!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let testURL = URL(string: "receiver://test")!
        button.isEnabled = UIApplication.shared.canOpenURL(testURL)
        updateDataSize(sender: slider)
    }

    @IBAction func transmit() {
        let payload = String(repeating: "x", count: dataSize)
        guard let url = URL(string: "receiver://\(payload)") else {
            showError("Failed to create the URL.")
            return
        }
        UIApplication.shared.open(url, options: [:]) { [unowned self] success in
            if !success {
                self.showError("Failed to open the URL.")
            }
        }
    }

    @IBAction func updateDataSize(sender: UISlider) {
        dataSize = Int(sender.value)
        statusLabel.text = "Data size: \(dataSize) bytes"
    }

    private func showError(_ error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
