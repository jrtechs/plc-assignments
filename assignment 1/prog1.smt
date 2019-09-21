; @author Jeffery Russell 9-18-19

(class Shape Object
    (perimeter area)
    
    (class-method initalize::shape (per ar)
        (init::shape (new self) per ar)
    )

    (method init::shape (per ar)
        (setPerimeter: self per)
        (setArea: self ar)
        self
    )

    (method getPerimeter () 
        perimeter
    )
    
    (method getArea () 
        area
    )

    (method setArea: (a)
        (set area a)
    )

    (method setPerimeter: (p)
        (set perimeter p)
    )
)


(class Circle Shape
    (radius)

    (class-method initalize:circle (rad)
        (init:circle (new self) rad)
    )

    (method init:circle (rad)
        (setRadius: self rad)
        self
    )

    (method setRadius: (rad)
        (set radius rad)
        (setArea: self (computeArea self))
        (setPerimeter: self (computePerimeter self))
    )

    (method getRadius ()
        radius
    )

    (method computeArea ()
        (* (asFloat (/ 22 7)) (asFloat (squared radius)) )
    )

    (method computePerimeter ()
        (* (asFloat 2) 
            (* (asFloat (/ 22 7)) (asFloat radius))
        )
    )
)


(class Rectangle Shape
    (length width)
)


(class Square Rectangle
    ()
)


(class Triangle Shape
    (side1 side2 side3)
)


(class Equilateral Triangle
    ()
)

;;;;;;;;;;;;;;; shape testers ;;;;;;;;;;;;;;;;;;

(localProtocol Shape)

(val shape1 (initalize::shape Shape 12 5))

; area
(getArea shape1)
(setArea: shape1 88)
(getArea shape1)

; perimeter
(getPerimeter shape1)
(setPerimeter: shape1 99)
(getPerimeter shape1)

;;;;;;;;;;;;;; circle testers ;;;;;;;;;;;;;;;;;;

(localProtocol Circle)

(val circle1 (initalize:circle Circle 5))
(getRadius circle1)
(getArea circle1)
(getPerimeter circle1)

(setRadius: circle1 6)
(getRadius circle1)
(getArea circle1)
(getPerimeter circle1)


