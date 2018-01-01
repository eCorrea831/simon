import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!

    var colorSequence = [SimonQuadrant]

    enum SimonQuadrant {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight

        var originColor: UIColor {
            switch self {
            case .topLeft: return .simonGreen
            case .topRight: return .simonRed
            case .bottomLeft: return .simonYellow
            case .bottomRight: return .simonBlue
            }
        }

        var litColor: UIColor {
            switch self {
            case .topLeft: return .simonBrightGreen
            case .topRight: return .simonBrightRed
            case .bottomLeft: return .simonBrightYellow
            case .bottomRight: return .simonBrightBlue
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setOriginColors()
        lightNextQuadrant()
    }

    func setOriginColors() {
        topLeftButton.imageView?.tintColor = .simonGreen
        topRightButton.imageView?.tintColor = .simonRed
        bottomLeftButton.imageView?.tintColor = .simonYellow
        bottomRightButton.imageView?.tintColor = .simonBlue
    }

    func lightNextQuadrant() {
        //get a random quadrant
        //animateButton for that quadrant
        //add it to the array
        //start a timer
        //handle user response, correct answer, incorrect answer, lack of answer
    }

    @IBAction func didTapSimonButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        if button == topLeftButton { animateButton(topLeftButton, for: .topLeft) }
        if button == topRightButton { animateButton(topRightButton, for: .topRight) }
        if button == bottomLeftButton { animateButton(bottomLeftButton, for: .bottomLeft) }
        if button == bottomRightButton { animateButton(bottomRightButton, for: .bottomRight) }
    }

    func animateButton(_ button: UIButton, for quadrant: SimonQuadrant) {
        UIView.animate(withDuration: 0.1, animations: { button.imageView?.tintColor = quadrant.litColor }, completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0.5, options: [], animations: { button.imageView?.tintColor = quadrant.originColor }, completion: nil)
        })
    }

    @IBAction func didTapGear(_ sender: Any) {
    }
}
