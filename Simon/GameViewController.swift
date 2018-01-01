import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!

    enum SimonButton {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        topLeftButton.imageView?.tintColor = .simonGreen
        topRightButton.imageView?.tintColor = .simonRed
        bottomLeftButton.imageView?.tintColor = .simonYellow
        bottomRightButton.imageView?.tintColor = .simonBlue
    }

    @IBAction func didTapSimonButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        if button == topLeftButton { lightUp(quadrant: .topLeft) }
        if button == topRightButton { lightUp(quadrant: .topRight) }
        if button == bottomLeftButton { lightUp(quadrant: .bottomLeft) }
        if button == bottomRightButton { lightUp(quadrant: .bottomRight) }
    }

    func lightUp(quadrant: SimonButton) {
        switch quadrant {
        case .topLeft: animateButton(topLeftButton, to: .simonBrightGreen, then: .simonGreen)
        case .topRight: animateButton(topRightButton, to: .simonBrightRed, then: .simonRed)
        case .bottomLeft: animateButton(bottomLeftButton, to: .simonBrightYellow, then: .simonYellow)
        case .bottomRight: animateButton(bottomRightButton, to: .simonBrightBlue, then: .simonBlue)
        }
    }

    func animateButton(_ button: UIButton, to brightColor: UIColor, then originalColor: UIColor) {
        UIView.animate(withDuration: 0.1, animations: { button.imageView?.tintColor = brightColor }, completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 1, options: [], animations: { button.imageView?.tintColor = originalColor }, completion: nil)
        })
    }

    @IBAction func didTapGear(_ sender: Any) {
    }
}
