import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    @IBOutlet var sizeSelector: UISegmentedControl!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let testURL = URL(string: "receiver://test")!
        button.isEnabled = UIApplication.shared.canOpenURL(testURL)
    }

    @IBAction func transmit() {
        let sizes: [Int] = [1, 100, 1000, 100_000, 1000_000]
        let dataSize = sizes[sizeSelector.selectedSegmentIndex]
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

    private func showError(_ error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
