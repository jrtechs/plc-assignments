; @author Jeffery Russell 9-18-19

(class Shape Object
    (perimeter area)
    
    (class-method initalize::shape per ar
        (setInitialParameters:: (new self) perimeter area)
        (setPerimeter: self per)
        (setArea: self ar)
    )

    (method getPerimeter () perimeter)
    
    (method getArea () area)

    (method setArea: (a)
        (set area a))

    (method setPerimeter: (p)
        (set perimeter p))
)


(class Circle Shape
    (radius)
)


(class Rectangle Shape
    (length width)
)


(class Square Rectangle

)


(class Triangle Shape
    (side1 side2 side3)
)


(class Equilateral Triangle
)