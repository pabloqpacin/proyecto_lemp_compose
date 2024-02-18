<?php
class User{
    
    public $id = null;
    
    public $name = '';
    public $email = '';
    public $phone = '';
    public $password = '';
    public $role = '';
    public $avatar = '';
    public $lastPassword = '';



    public function __construct($data = null) {
        $this->name = isset($data['name']) ?  $data['name'] : null;
        $this->email = isset($data['email']) ? $data['email'] : null;
        $this->phone = isset($data['phone']) ? $data['phone'] : null ;
        $this->password = isset($data['password']) ? $data['password'] : null; 
        $this->role = isset($data['role']) ? $data['role'] : null ;
        $this->lastPassword = isset($data['password']) ? $data['password'] : null;
        
        $this->db = Database::getInstance();

        return $this;
    }

    public function save(){
        $sql = "INSERT INTO  users (name, email,phone, password, role, last_password)
                VALUES ('$this->name', '$this->email', '$this->phone', '$this->password', '$this->role', '$this->lastPassword')";
                //print_r($sql);die();
        if($this->db->query($sql) === false) {
            throw new Exception($this->db->error);
        }
        $id = $this->db->insert_id;
        return self::find($id);

    }

    public static function find($id){
        $sql ="SELECT * FROM users WHERE id = '$id'";
       // print_r($sql);die();
        $self = new static;
        $res = $self->db->query($sql);
        if($res->num_rows < 1) return false;
        $self->populateObject($res->fetch_object());
        return $self;
    }

    public static function findAll(){
        $sql = "SELECT * FROM users ORDER BY id DESC";
        $users = [];
        $self = new static;
        $res = $self->db->query($sql);
        
        if($res->num_rows < 1) return new static;

        while($row = $res->fetch_object()){
            $user = new static;
            $user->populateObject($row);
            $users[] = $user;
        }

        return $users;
    } 


    public function populateObject($object){

        foreach($object as $key => $property){
            $this->$key = $property;
        }
    }



    
}