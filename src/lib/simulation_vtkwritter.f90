    !------------------------------------------------------------------------------
    !        IST/MARETEC, Water Modelling Group, Mohid modelling system
    !------------------------------------------------------------------------------
    !
    ! TITLE         : Mohid Model
    ! PROJECT       : Mohid Lagrangian Tracer
    ! MODULE        : simulation_vtkwritter
    ! URL           : http://www.mohid.com
    ! AFFILIATION   : IST/MARETEC, Marine Modelling Group
    ! DATE          : July 2018
    ! REVISION      : Canelas 0.1
    !> @author
    !> Ricardo Birjukovs Canelas
    !
    ! DESCRIPTION:
    !> Defines a vtk writer class for the exposable to the Simulation 
    !------------------------------------------------------------------------------

    module simulation_vtkwritter_mod

    use common_modules
    use vtk_fortran
    use boundingbox_mod
    use blocks_mod

    implicit none
    private
    
    type :: vtkwritter_class
        private
        integer :: vtk_unit = 10
    contains
    procedure :: DomainVTK
    end type vtkwritter_class
    
    type(vtkwritter_class) :: vtkWritter

    !Public access vars
    public :: vtkWritter

    !Public access procedures
    !public :: getTimeStamp

    contains
    
    !---------------------------------------------------------------------------
    !> @author Ricardo Birjukovs Canelas - MARETEC
    !> @brief
    !> Public Tracer writting routine. Writes Tracer data in binary XML VTK
    !> format using an unstructured grid. Serial writer for serial files.
    !---------------------------------------------------------------------------
    subroutine TracerSerialVTK(self, filename, blocks)
    implicit none
    class(vtkwritter_class), intent(inout) :: self
    type(string), intent(in) :: filename
    class(block_class), dimension(:), intent(in) :: blocks  !< Case Blocks
    
    integer :: error
    type(vtk_file) :: vtk_file
    
    error = vtk_file%initialize(format='binary', filename=filename%chars()//'.vtu', mesh_topology='UnstructuredGrid')
    
    error = vtk_file%finalize()
    
    end subroutine TracerSerialVTK
    
    !---------------------------------------------------------------------------
    !> @author Ricardo Birjukovs Canelas - MARETEC
    !> @brief
    !> Public simulation domain writting routine. Writes binary XML VTK
    !> format using an unstructured grid.
    !> @parm[in] self, filename, bbox, npbbox, blocks
    !---------------------------------------------------------------------------
    subroutine DomainVTK(self, filename, bbox, npbbox, blocks)
    implicit none
    class(vtkwritter_class), intent(inout) :: self
    type(string), intent(in) :: filename                    !< name of the case to add
    class(boundingbox_class), intent(in) :: bbox            !< Case bounding box
    class(block_class), dimension(:), intent(in) :: blocks  !< Case Blocks
    integer, intent(in) :: npbbox                           !< number of points of the bbox geometry
    
    type(vtk_file) :: vtk_file                              !< file object
    type(string) :: fullfilename
    type(string) :: outext
    integer :: error, i, b
    integer, parameter :: nc = 1                            !< Number of cells of the geometry
    real(prec), dimension(1:npbbox) :: xx, yy, zz           !< coordinates of the  geometry
    type(vector) :: pts(npbbox)                             !< coordinates of the  geometry
    integer, dimension(1:npbbox) :: connect, var            !< Connectivity array and a simple pointwise variable
    integer(I4P), dimension(1:nc) :: offset
    integer(I1P), dimension(1:nc) :: cell_type              !< VTK cell type. 1 for point and 12 for hexahedron
    
    offset = [8]
    cell_type = [12]
    
    !preparing file
    fullfilename = filename%chars()//'_Domain.vtu'
    outext = '->Writting Domain file '//fullfilename
    call Log%put(outext)
    fullfilename = Globals%Names%outpath//'/'//fullfilename
    
    error = vtk_file%initialize(format='binary', filename=fullfilename%chars(), mesh_topology='UnstructuredGrid')
    
    !Writting bounding box geometry
    pts = Geometry%getPoints(bbox)
    do i=1, npbbox
        xx(i) = pts(i)%x
        yy(i) = pts(i)%y
        zz(i) = pts(i)%z
        connect(i) = i-1
    end do    
    error = vtk_file%xml_writer%write_piece(np=npbbox, nc=nc)
    error = vtk_file%xml_writer%write_geo(np=npbbox, nc=nc, x=xx, y=yy, z=zz)
    error = vtk_file%xml_writer%write_connectivity(nc=nc, connectivity=connect, offset=offset, cell_type=cell_type)
    error = vtk_file%xml_writer%write_piece()
    
    !Writting block geometries
    do b=1, size(blocks)
        pts = Geometry%getPoints(blocks(b)%extents)
        do i=1, npbbox
            xx(i) = pts(i)%x
            yy(i) = pts(i)%y
            !zz(i) = pts(i)%z
            connect(i) = i-1
            var(i) = b
        end do    
        error = vtk_file%xml_writer%write_piece(np=npbbox, nc=nc)
        error = vtk_file%xml_writer%write_geo(np=npbbox, nc=nc, x=xx, y=yy, z=zz)
        error = vtk_file%xml_writer%write_connectivity(nc=nc, connectivity=connect, offset=offset, cell_type=cell_type)
        error = vtk_file%xml_writer%write_dataarray(location='node', action='open')
        error = vtk_file%xml_writer%write_dataarray(data_name='Block', x=var)
        error = vtk_file%xml_writer%write_dataarray(location='node', action='close')
        error = vtk_file%xml_writer%write_piece()
    end do
        
    !Closing file
    error = vtk_file%finalize()
    
    end subroutine DomainVTK
    
    

  end module simulation_vtkwritter_mod