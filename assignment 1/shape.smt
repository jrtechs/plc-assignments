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