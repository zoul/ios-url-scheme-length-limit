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
        let payload = randomStringOfLength(dataSize)
        guard let url = URL(string: "receiver://\(payload)") else {
            showError("Failed to create the URL.")
            return
        }
        UIApplication.shared.openURL(url)
    }

    private func showError(_ error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    private func randomStringOfLength(_ len: Int) -> String {
        let chars = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        let charCount = UInt32(chars.count)
        var out = ""
        for _ in 0 ..< len {
            let i = Int(arc4random_uniform(charCount))
            out += String(chars[i])
        }
        return out
    }
}
