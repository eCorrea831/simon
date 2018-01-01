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
        case .topLeft:
            topLeftButton.imageView?.tintColor = .simonBrightGreen
        case .topRight:
            topRightButton.imageView?.tintColor = .simonBrightRed
        case .bottomLeft:
            bottomLeftButton.imageView?.tintColor = .simonBrightYellow
        case .bottomRight:
            bottomRightButton.imageView?.tintColor = .simonBrightBlue
        }
    }

    @IBAction func didTapGear(_ sender: Any) {
    }
}
