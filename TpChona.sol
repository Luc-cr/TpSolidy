pragma solidity >=0.7.0 <0.9.0;

contract TrabajoPracticoChona {

    string private nombre;
    string private apellido;
    string private curso;
    address private docente;
    mapping(string => uint) private notas_materias;
    string[] private materias;

    constructor(string memory _nombre , string memory _apellido, string memory _curso){

        nombre = _nombre;
        apellido = _apellido;
        curso = _curso;
        docente = msg.sender;
    }

    function concatenate(string memory a,string memory b) public pure returns (string memory){

        return string(abi.encodePacked(a,' ',b));

    } 


    function get_apellido() public view returns (string memory) {

        return apellido;

    }

    function get_curso() public view returns (string memory) {

        return curso;

    }


    function get_complete() public view returns (string memory) {

        return (concatenate(nombre, apellido));

    }


    function set_nota_materia(uint nota, string memory materia) public{

        require(msg.sender == docente, "caller not teacher");

        notas_materias[materia] = nota;

        materias.push(materia);
    }


    function nota_materia(string memory materia) public view returns (uint){

        return notas_materias[materia];

    }


    function aprobo(string memory materia) public view returns(bool){

        if(nota_materia(materia) >= 6){

            return true;

        } else{

            return false;

        }

    }
    function promedio() public view returns (uint){

        uint currentValue;

        for (uint i=0; i < materias.length; i++) {

            currentValue += notas_materias[materias[i]];

            }   

        return (currentValue/materias.length);
    }   
}