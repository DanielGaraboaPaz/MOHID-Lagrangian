    !------------------------------------------------------------------------------
    !        IST/MARETEC, Water Modelling Group, Mohid modelling system
    !------------------------------------------------------------------------------
    !
    ! TITLE         : Mohid Model
    ! PROJECT       : Mohid Lagrangian Tracer
    ! MODULE        : solver
    ! URL           : http://www.mohid.com
    ! AFFILIATION   : IST/MARETEC, Marine Modelling Group
    ! DATE          : September 2018
    ! REVISION      : Canelas 0.1
    !> @author
    !> Ricardo Birjukovs Canelas
    !
    ! DESCRIPTION:
    !> Defines an Solver class. This class invokes the different available integration
    !> algorithms as methods, and these invoke the necessary interpolation objects.
    !------------------------------------------------------------------------------

    module solver_mod


    use common_modules
    use stateVector_mod
    use background_mod
    use interpolator_mod
    use kernel_mod

    implicit none
    private

    type :: solver_class        !< Solver class
        integer :: solverType = 1   !< Integration Algorithm 1:Euler, 2:Multi-Step Euler, 3:RK4 (default=1)
        type(string) :: name        !< Name of the Integrator algorithm        
        type(kernel_class) :: Kernel
    contains
    procedure :: initialize => initSolver
    procedure :: runStep
    procedure, private :: runStepEuler
    procedure, private :: runStepMSEuler    
    !procedure, private :: runStepRK4
    procedure :: print => printSolver
    end type solver_class

    !Public access vars
    public :: solver_class

    contains

    !---------------------------------------------------------------------------
    !> @author Ricardo Birjukovs Canelas - MARETEC
    !> @brief
    !> Method that integrates the Tracer State Vector in one time-step, according to
    !> the selected integration algorithm
    !> @param[in] self, state, bdata, time, dt
    !---------------------------------------------------------------------------
    subroutine runStep(self, state, bdata, time, dt)
    class(solver_class), intent(inout) :: self
    type(stateVector_class), dimension(:), intent(inout) :: state
    type(background_class), dimension(:), intent(in) :: bdata
    real(prec), intent(in) :: time, dt
    !so the forward integrators don't overextend beyond calendar time
    if (time+dt < Globals%Parameters%TimeMax) then
        if (self%solverType == 1) call self%runStepEuler(state, bdata, time, dt)
        if (self%solverType == 2) call self%runStepMSEuler(state, bdata, time, dt)
        !if (self%solverType == 3) call self%runStepRK4(state, bdata, time, dt)
    end if
    end subroutine runStep

    !---------------------------------------------------------------------------
    !> @author Ricardo Birjukovs Canelas - MARETEC
    !> @brief
    !> Method that integrates the Tracer state array in one time-step, using a
    !> Velocity Euler integration algorithm. This is a one-shot type
    !> explicit scheme with low computational cost. Implements
    !> \f$ {\vec {x}}_{t+\Delta t}={\vec {x}}_{t}+{\vec {v}}_{t}\Delta t+{\frac {1}{2}}{\vec {a}}({\vec {x}}_{t})\Delta t^{2}\f$
    !> \f$ {\vec {v}}_{t+\Delta t}={\vec {v}}_{t}+\frac{{\vec {a}}_{t+\Delta t}+{\vec {a}}_{t}}{2}\Delta t\f$
    !> @param[in] self, state, bdata, time, dt
    !---------------------------------------------------------------------------
    subroutine runStepEuler(self, sv, bdata, time, dt)
    class(solver_class), intent(inout) :: self
    type(stateVector_class), dimension(:), intent(inout) :: sv
    type(background_class), dimension(:), intent(in) :: bdata
    real(prec), intent(in) :: time, dt
    integer :: i

    do i=1, size(sv)
        sv(i)%state = sv(i)%state + self%Kernel%run(sv(i), bdata, time, dt)*dt
    end do
    
    end subroutine runStepEuler

    !---------------------------------------------------------------------------
    !> @author Ricardo Birjukovs Canelas - MARETEC
    !> @brief
    !> Method that integrates the Tracer state vector in one time-step, using a
    !> Multi-Step Euler integration algorithm. This is a predictor-corrector type
    !> explicit scheme with excelent conservation properties and average cost
    !> @param[in] self, sv, bdata, time, dt
    !---------------------------------------------------------------------------
    subroutine runStepMSEuler(self, sv, bdata, time, dt)
    class(solver_class), intent(inout) :: self
    type(stateVector_class), dimension(:), intent(inout) :: sv
    type(background_class), dimension(:), intent(in) :: bdata
    real(prec), intent(in) :: time, dt
    type(stateVector_class) :: predSv
    real(prec), allocatable, dimension(:,:) :: predKernel
    real(prec):: mstime
    integer :: i

    mstime = time + 0.5*dt
    
    do i=1, size(sv)
        !creating predictor step state vector
        call sv(i)%copyState(predSv)
        allocate(predKernel(size(sv(i)%state, 1), size(sv(i)%state, 2)))
        !computing predictor step
        predKernel = self%Kernel%run(sv(i), bdata, time, dt)
        predSv%state = sv(i)%state + predKernel*dt
        !computing corrector step
        sv(i)%state = sv(i)%state + (predKernel +  self%Kernel%run(predSv, bdata, mstime, dt))*(dt*0.5)
        !deallocating
        call predSv%finalize()
        deallocate(predKernel)
    end do
    
    end subroutine runStepMSEuler
    !
    !!---------------------------------------------------------------------------
    !!> @author Ricardo Birjukovs Canelas - MARETEC
    !!> @brief
    !!> Method that integrates the Tracer state array in one time-step, using a
    !!> Runge-Kuta 4th order integration algorithm. This is an explicit scheme
    !!> with medium to high computational cost
    !!> @param[in] self, aot, bdata, time, dt
    !!---------------------------------------------------------------------------
    !subroutine runStepRK4(self, aot, bdata, time, dt)
    !class(solver_class), intent(inout) :: self
    !type(aot_class), intent(inout) :: aot
    !type(background_class), dimension(:), intent(in) :: bdata
    !real(prec), intent(in) :: time, dt
    !type(aot_class), dimension(4) :: k
    !real(prec) :: mstime
    !integer :: np, nf, bkg
    !real(prec), dimension(:,:), allocatable :: var_dt
    !type(string), dimension(:), allocatable :: var_name
    !
    !!update velocities for the predictor step
    !nf = Utils%find_str(var_name, Globals%Var%u, .true.)
    !k(1)%u = var_dt(:,nf)
    !nf = Utils%find_str(var_name, Globals%Var%v, .true.)
    !k(1)%v = var_dt(:,nf)
    !nf = Utils%find_str(var_name, Globals%Var%w, .false.)
    !if (nf /= MV_INT) k(1)%w = var_dt(:,nf)
    !if (nf == MV_INT) k(1)%w = 0.0
    !!-----k1 step: k1 = f(x_n,t_n)-----
    !
    !!---- k2 step: k2 = f(x_n + k1/2,t_n + dt/2)------
    !!update positions:  x_n + k1./2*dt
    !k(2)%x = k(1)%x + Utils%m2geo(k(1)%u, k(1)%y, .false.)*0.5*dt
    !k(2)%y = K(1)%y + Utils%m2geo(k(1)%v, k(1)%y, .true.)*0.5*dt
    !k(2)%z = k(1)%z + k(1)%w*dt*0.5
    !!update the time: t + dt/2
    !mstime = time+0.5*dt
    !!run the interpolator: f(x_n + k1/2,t + dt/2)
    !call self%Interpolator%run(k(2), bdata(bkg), mstime, var_dt, var_name)
    !!update velocities
    !nf = Utils%find_str(var_name, Globals%Var%u, .true.)
    !k(2)%u = var_dt(:,nf)
    !nf = Utils%find_str(var_name, Globals%Var%v, .true.)
    !k(2)%v = var_dt(:,nf)
    !nf = Utils%find_str(var_name, Globals%Var%w, .false.)
    !if (nf /= MV_INT) k(2)%w = var_dt(:,nf)
    !if (nf == MV_INT) k(2)%w = 0.0
    !!---- k2 step: k2 = f(x_n + k1/2,t + dt/2)------
    !
    !!---- k3 step: k3 = f(x_n+k2*1/2*dt,t_n+1/2*dt)
    !!update positions: x_n + k2*dt/2
    !k(3)%x = k(2)%x + Utils%m2geo(k(2)%u, k(2)%y, .false.)*0.5*dt
    !k(3)%y = k(2)%y + Utils%m2geo(k(2)%v, k(2)%y, .true.)*0.5*dt
    !k(3)%z = k(2)%z + k(2)%w*dt*0.5
    !!update the time: t + dt/2
    !mstime = time+0.5*dt
    !!Corrector step
    !!run the interpolator: f(x_n + k2*dt/2,t + dt/2)
    !call self%Interpolator%run(k(3), bdata(bkg), mstime, var_dt, var_name)
    !!update velocities
    !nf = Utils%find_str(var_name, Globals%Var%u, .true.)
    !k(3)%u = var_dt(:,nf)
    !nf = Utils%find_str(var_name, Globals%Var%v, .true.)
    !k(3)%v = var_dt(:,nf)
    !nf = Utils%find_str(var_name, Globals%Var%w, .false.)
    !if (nf /= MV_INT) k(3)%w = var_dt(:,nf)
    !if (nf == MV_INT) k(3)%w = 0.0
    !!---- k3 step: k3 = f(x_n+k2*1/2*dt,t_n+1/2*dt)
    !
    !!---- k4 step: k4 = f(x_n + k3,t + dt)------
    !!update positions: x_n + k3*dt
    !k(4)%x = k(3)%x + Utils%m2geo(k(3)%u, k(3)%y, .false.)*dt
    !k(4)%y = k(3)%y + Utils%m2geo(k(3)%v, k(3)%y, .true.)*dt
    !k(4)%z = k(3)%z + k(3)%w*dt
    !!update the time: t + dt2
    !mstime = time+dt
    !call self%Interpolator%run(k(4), bdata(bkg), mstime, var_dt, var_name)
    !!update velocities
    !nf = Utils%find_str(var_name, Globals%Var%u, .true.)
    !k(4)%u = var_dt(:,nf)
    !nf = Utils%find_str(var_name, Globals%Var%v, .true.)
    !k(4)%v = var_dt(:,nf)
    !nf = Utils%find_str(var_name, Globals%Var%w, .false.)
    !if (nf /= MV_INT) k(4)%w = var_dt(:,nf)
    !if (nf == MV_INT) k(4)%w = 0.0
    !!---- k4 step: k4 = f(x_n + k3,t + dt)------
    !
    !aot%u = (k(1)%u + 2.*k(2)%u + 2.*k(3)%u + k(4)%u)/6.0
    !aot%v = (k(1)%v + 2.*k(2)%v + 2.*k(3)%v + k(4)%v)/6.0
    !aot%w = (k(1)%w + 2.*k(2)%w + 2.*k(3)%w + k(4)%w)/6.0
    !
    !aot%x = aot%x + aot%u*dt
    !aot%y = aot%y + aot%v*dt
    !aot%z = aot%z + aot%w*dt
    !!update land mask status
    !nf = Utils%find_str(var_name, Globals%Var%landMask, .false.)
    !if (nf /= MV_INT) aot%landMask = nint(var_dt(:,nf))
    !if (nf == MV_INT) aot%landMask = Globals%Mask%waterVal
    !!marking tracers for deletion because they are in land
    !where(aot%landMask == 2) aot%active = .false.
    !!update land interaction status
    !nf = Utils%find_str(var_name, Globals%Var%landIntMask, .false.)
    !if (nf /= MV_INT) aot%landIntMask = nint(var_dt(:,nf))
    !if (nf == MV_INT) aot%landIntMask = Globals%Mask%waterVal
    !
    !end subroutine runStepRK4

    !---------------------------------------------------------------------------
    !> @author Ricardo Birjukovs Canelas - MARETEC
    !> @brief
    !> Initializer method for the Solver class. Sets the type of integrator
    !> and name of the algorithm this Solver will call
    !> @param[in] self, flag, name
    !---------------------------------------------------------------------------
    subroutine initSolver(self, flag, name)
    class(solver_class), intent(inout) :: self
    integer, intent(in) :: flag
    type(string), intent(in) :: name
    type(string) :: interpName
    self%solverType = flag
    self%name = name   
    call self%Kernel%initialize()
    end subroutine initSolver

    !---------------------------------------------------------------------------
    !> @author Ricardo Birjukovs Canelas - MARETEC
    !> @brief
    !> Method that prints the Solver information
    !---------------------------------------------------------------------------
    subroutine printSolver(self)
    class(solver_class), intent(inout) :: self
    type(string) :: outext, t
    outext = 'Solver algorithm is '//self%name
    call Log%put(outext,.false.)
    end subroutine printSolver

    end module solver_mod

