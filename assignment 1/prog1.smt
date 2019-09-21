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
        (* 
            (asFloat (/ 22 7)) 
            (asFloat (squared radius))
        )
    )

    (method computePerimeter ()
        (* 
            (asFloat 2) 
            (* 
                (asFloat (/ 22 7)) 
                (asFloat radius)
            )
        )
    )
)


(class Rectangle Shape
    (length width)

    (class-method initalize::rectangle (len wid)
        (init::rectangle (new self) len wid)
    )

    (method init::rectangle (len wid)
        (set width wid)
        (set length len)
        (setArea: self (computeArea self))
        (setPerimeter: self (computePerimeter self))
        self
    )

    (method getLength ()
        length
    )

    (method getWidth ()
        width
    )

    (method setWidth: (wid)
        (set width wid)
        
        (setArea: self (computeArea self))
        (setPerimeter: self (computePerimeter self))
    )

    (method setLength: (len)
        (set length len)
        
        (setArea: self (computeArea self))
        (setPerimeter: self (computePerimeter self))
    )

    (method computeArea ()
        (* width length)
    )

    (method computePerimeter ()
        (+ 
            (* 
                (asFloat 2)
                (asFloat length)
            )
            (*
                (asFloat 2)
                (asFloat width)
            )
        )
    )
)


(class Square Rectangle
    ()
    
    (class-method initalize:square (len)
        (init:square (new self) len)
    )

    (method init:square (len)
        (setSide: self len)
        self
    )

    (method getSide ()
        length
    )

    (method setSide: (sid)
        (set width sid)
        (set length sid)
        (setArea: self (computeArea self))
        (setPerimeter: self (computePerimeter self))
    )
)


(class Triangle Shape
    (side1 side2 side3)
)


(class Equilateral Triangle
    ()
)

;;;;;;;;;;;;;;; shape testers ;;;;;;;;;;;;;;;;;;
#shapeTesters ; prints shape testers

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
#CircleTesters

(localProtocol Circle)

(val circle1 (initalize:circle Circle 5))
(getRadius circle1)
(getArea circle1)
(getPerimeter circle1)

(setRadius: circle1 6)
(getRadius circle1)
(getArea circle1)
(getPerimeter circle1)


;;;;;;;;;;;;;; Rectangle Testers ;;;;;;;;;;;;;;;

#RectangleTesters ; prints rectangle testers

(localProtocol Rectangle)
(val rec1 (initalize::rectangle Rectangle 3 2))
(getLength rec1)
(getWidth rec1)
(getArea rec1)
(getPerimeter rec1)

(setLength: rec1 10)
(setWidth: rec1 12)
(getLength rec1)
(getWidth rec1)
(getArea rec1)
(getPerimeter rec1)


;;;;;;;;;;;;;; Square Testers ;;;;;;;;;;;;;;;;;

#SquareTesters

(localProtocol Square)
(val sq1 (initalize:square Square 5))

(getSide sq1)
(getPerimeter sq1)
(getArea sq1)

(setSide: sq1 4)
(getSide sq1)
(getPerimeter sq1)
(getArea sq1)


(setSide: sq1 8)
(getSide sq1)
(getPerimeter sq1)
(getArea sq1)


