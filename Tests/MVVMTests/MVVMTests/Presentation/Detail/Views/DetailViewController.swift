//
//  DetailViewController.swift
//  MVVMTests
//
//  Created by David Jardon on 29/11/23.
//

import UIKit
import MapKit
import Kingfisher

@MainActor
class DetailViewController: UIViewController {
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var coordinates: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var heroDescription: UITextView!

    @IBAction func onBackPressed() {
        viewModel?.onBackPressed()
    }

    var viewModel: DetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        setObservers()
        viewModel?.onViewAppear()
    }

    private func initViews() {
        mapView.delegate = self
    }

    private func setObservers() {
        viewModel?.viewState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                    case .loading(let isLoading):
                        self?.loadingView.isHidden = !isLoading

                    case .updateData(hero: let hero, locations: let locations):
                        self?.updateViews(
                            image: hero?.photo,
                            name: hero?.name,
                            description: hero?.description,
                            locations: locations
                        )
                }
            }
        }
    }

    private func updateViews(
        image: String?,
        name: String?,
        description: String?,
        locations: HeroAnnotations?
    ) {
        photo.kf.setImage(with: URL(string: image ?? ""))
        makeRounded(image: photo)

        updateSelectedCoordinates()
        self.name.text = name
        heroDescription.text = description

        locations?.forEach { mapView.addAnnotation($0) }
    }

    private func updateSelectedCoordinates(_ coordinates: String? = nil) {
        self.coordinates.text = coordinates
    }

    private func makeRounded(image: UIImageView) {
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.white.cgColor.copy(alpha: 0.6)
        image.layer.cornerRadius = image.frame.height / 2
        image.layer.masksToBounds = false
        image.clipsToBounds = true
    }
}

extension DetailViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? HeroAnnotation else { return }
        updateSelectedCoordinates(
            "Last Coordinates: \(annotation.coordinate.latitude), \(annotation.coordinate.longitude)"
        )
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "HeroAnnotation"
        let annotationView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier
        ) ?? MKAnnotationView(
            annotation: annotation,
            reuseIdentifier: identifier
        )

        annotationView.canShowCallout = true
        if annotation is MKUserLocation {
            return nil
        } else if annotation is HeroAnnotation {
            // Resize image
            let pinImage = UIImage(named: "img_map_pin")
            let size = CGSize(width: 30, height: 30)
            UIGraphicsBeginImageContext(size)
            pinImage!.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()

            annotationView.image = resizedImage
            return annotationView
        } else {
            return nil
        }
    }
}
