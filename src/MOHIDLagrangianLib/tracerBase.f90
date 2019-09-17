    !------------------------------------------------------------------------------
    !        IST/MARETEC, Water Modelling Group, Mohid modelling system
    !------------------------------------------------------------------------------
    !
    ! TITLE         : Mohid Model
    ! PROJECT       : Mohid Lagrangian Tracer
    ! MODULE        : tracer_base
    ! URL           : http://www.mohid.com
    ! AFFILIATION   : IST/MARETEC, Marine Modelling Group
    ! DATE          : April 2018
    ! REVISION      : Canelas 0.1
    !> @author
    !> Ricardo Birjukovs Canelas
    !
    ! DESCRIPTION:
    !> Module that defines a pure Lagrangian tracer class and related methods.
    !------------------------------------------------------------------------------

    module tracerBase_mod

    use common_modules
    use sources_mod

    implicit none
    private

    type :: tracer_par_class               !<Type - parameters of a pure Lagrangian tracer object
        integer :: id = MV                       !< unique tracer identification
        integer :: idsource = MV                 !< Source to which the tracer belongs
        integer :: ttype
    end type tracer_par_class

    type :: tracer_state_class             !<Type - state variables of a pure Lagrangian tracer object
        real(prec) :: age = MV             ! time variables
        logical :: active = .false.             !< active switch
        type(vector) :: pos                     !< Position of the tracer (deg, deg, m)
        type(vector) :: vel                     !< Velocity of the tracer (m s-1)
        type(vector) :: diffusionVel            !< Velocity of the tracer due to diffusion processes (m s-1)
        real(prec) :: usedMixingLenght          !< spacial step using current random velocity from diffusion (m)
    end type tracer_state_class

    type :: tracer_class                   !<Type - The pure Lagrangian tracer class
        type(tracer_par_class)   :: par         !<To access parameters
        type(tracer_state_class) :: now         !<To access state variables
        type(string), allocatable, dimension(:) :: varName  !< a list of variable names that this tracer has
    contains
    procedure :: getNumVars
    procedure :: getStateArray
    procedure :: setStateArray
    procedure :: print => printTracer
    end type tracer_class

    !Public access vars
    public :: tracer_class

    !Public access routines
    public :: Tracer

    interface Tracer !< Constructor
    procedure constructor
    end interface

    contains

    !---------------------------------------------------------------------------
    !> @author Ricardo Birjukovs Canelas - MARETEC
    !> @brief
    !> Method that returns the number of variables used by this tracer
    !---------------------------------------------------------------------------
    integer function getNumVars(self)
    class(tracer_class), intent(in) :: self
    getNumVars = 11
    end function getNumVars

    !---------------------------------------------------------------------------
    !> @author Ricardo Birjukovs Canelas - MARETEC
    !> @brief
    !> Method that returns the state array of this tracer
    !---------------------------------------------------------------------------
    function getStateArray(self)
    class(tracer_class), intent(in) :: self
    real(prec), allocatable, dimension(:) :: getStateArray
    allocate(getStateArray(self%getNumVars()))
    getStateArray(1) = self%now%pos%x
    getStateArray(2) = self%now%pos%y
    getStateArray(3) = self%now%pos%z
    getStateArray(4) = self%now%vel%x
    getStateArray(5) = self%now%vel%y
    getStateArray(6) = self%now%vel%z
    getStateArray(7) = self%now%diffusionVel%x
    getStateArray(8) = self%now%diffusionVel%y
    getStateArray(9) = self%now%diffusionVel%z
    getStateArray(10) = self%now%usedMixingLenght
    getStateArray(11) = self%now%age
    end function getStateArray

    !---------------------------------------------------------------------------
    !> @author Ricardo Birjukovs Canelas - MARETEC
    !> @brief
    !> Method that sets the state array of this tracer
    !---------------------------------------------------------------------------
    subroutine setStateArray(self, stateArray)
    class(tracer_class), intent(inout) :: self
    real(prec), dimension(:), intent(in) :: stateArray
    self%now%pos%x = StateArray(1)
    self%now%pos%y = StateArray(2)
    self%now%pos%z = StateArray(3)
    self%now%vel%x = StateArray(4)
    self%now%vel%y = StateArray(5)
    self%now%vel%z = StateArray(6)
    self%now%diffusionVel%z = StateArray(7)
    self%now%diffusionVel%z = StateArray(8)
    self%now%diffusionVel%z = StateArray(9)
    self%now%usedMixingLenght = StateArray(10)
    self%now%age   = StateArray(11)
    end subroutine setStateArray

    !---------------------------------------------------------------------------
    !> @author Ricardo Birjukovs Canelas - MARETEC
    !> @brief
    !> Method to print basic info about the Tracer
    !---------------------------------------------------------------------------
    subroutine printTracer(self)
    class(tracer_class), intent(inout) :: self
    type(string) :: outext, t(6)
    if (self%now%active .eqv. .false.) then
        outext = '-->Tracer is inactive'
        call Log%put(outext,.false.)
    else
        t(1) = self%par%id
        t(2) = self%now%pos%x
        t(3) = self%now%pos%y
        t(4) = self%now%pos%z
        outext = 'Tracer['//t(1)//']::xyz('//t(2)//','//t(3)//','//t(4)//')'
        call Log%put(outext,.false.)
    end if
    end subroutine printTracer

    !---------------------------------------------------------------------------
    !> @author Ricardo Birjukovs Canelas - MARETEC
    !> @brief
    !> Base Tracer constructor
    !> @param[in] id, src, time, p
    !---------------------------------------------------------------------------
    function constructor(id, src, time, p, varNum)
    type(tracer_class) :: constructor
    integer, intent(in) :: id
    class(source_class), intent(in) :: src
    real(prec), intent(in) :: time
    integer, intent(in) :: p
    integer, intent(in), optional :: varNum
    integer :: varN
    varN = constructor%getNumVars()
    if (present(varNum)) varN = varNum
    ! initialize parameters
    constructor%par%id = id
    constructor%par%idsource = src%par%id
    constructor%par%ttype = Globals%Types%base
    ! initialize tracer state
    constructor%now%age=0.0
    constructor%now%active = .true.
    constructor%now%pos = src%stencil%ptlist(p) + src%now%pos
    constructor%now%vel = 0.0
    constructor%now%diffusionVel = 0.0
    constructor%now%usedMixingLenght = 0.0
    ! initialize var name list
    allocate(constructor%varName(varN))
    constructor%varName(1) = 'x'
    constructor%varName(2) = 'y'
    constructor%varName(3) = 'z'
    constructor%varName(4) = Globals%Var%u
    constructor%varName(5) = Globals%Var%v
    constructor%varName(6) = Globals%Var%w
    constructor%varName(7) = 'dVelX'
    constructor%varName(8) = 'dVelY'
    constructor%varName(9) = 'dVelZ'
    constructor%varName(10) = 'mLen'
    constructor%varName(11) = 'age'
    end function constructor

    end module tracerBase_mod