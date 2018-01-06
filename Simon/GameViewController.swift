import UIKit

/*TODO:
  - Need to implement some kind of timer after each quadrant is lit and only give the user a certain number of seconds to hit the right color before it says game over
 - It's lighting up two colors at a time right now for some reason
 - Need to fix logic so that the game plays the whole sequence and the user plays one at a time and it checks after each
 */


class GameViewController: UIViewController {
    @IBOutlet weak var mainCTA: UIButton!
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!

    var colorSequence = [SimonQuadrant]()
    var userSequence = [SimonQuadrant]()

    enum SimonQuadrant: Int {
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
    }

    func setOriginColors() {
        topLeftButton.imageView?.tintColor = .simonGreen
        topRightButton.imageView?.tintColor = .simonRed
        bottomLeftButton.imageView?.tintColor = .simonYellow
        bottomRightButton.imageView?.tintColor = .simonBlue
    }

    func getButton(for quadrant: SimonQuadrant) -> UIButton {
        switch quadrant {
        case .topLeft: return topLeftButton
        case .topRight: return topRightButton
        case .bottomLeft: return bottomLeftButton
        case .bottomRight: return bottomRightButton
        }
    }

    func getQuadrant(for button: UIButton) -> SimonQuadrant {
        if button == topLeftButton { return .topLeft }
        else if button == topRightButton { return .topRight }
        else if button == bottomLeftButton { return .bottomLeft }
        else { return .bottomRight }
    }

    @IBAction func didTapMainCTA(_ sender: Any) {
        mainCTA.isHidden = true
        lightNextQuadrant()
    }

    @IBAction func didTapSimonButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        let quadrant = getQuadrant(for: button)
        animateButton(button, for: quadrant)
        userSequence.append(quadrant)
        checkForMatchingSequence()
    }

    func lightNextQuadrant() {
        let randomNumber = Int(arc4random_uniform(4))
        guard let quadrant = SimonQuadrant(rawValue: randomNumber) else { return }
        let button = getButton(for: quadrant)
        animateButton(button, for: quadrant)
        colorSequence.append(quadrant)
    }

    func animateButton(_ button: UIButton, for quadrant: SimonQuadrant) {
        UIView.animate(withDuration: 0.1, animations: { button.imageView?.tintColor = quadrant.litColor }, completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0.5, options: [], animations: { button.imageView?.tintColor = quadrant.originColor }, completion: nil)
        })
    }

    func checkForMatchingSequence() {
        var currentCorrectSequence = [SimonQuadrant]()
        for i in 0..<userSequence.count { currentCorrectSequence.append(colorSequence[i]) }
        userSequence == currentCorrectSequence ? continuePlay() : endGame()
    }

    func continuePlay() {
        lightNextQuadrant()
    }

    func endGame() {
        print("You lose!")
    }

    @IBAction func didTapGear(_ sender: Any) {
    }
}
