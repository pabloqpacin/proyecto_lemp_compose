<?php
class Requester{
    
    public $id = null;
    
    public $name = '';

    public $email = '';

    public $phone = '';

    private $db = null;


    public function __construct($data = null) 
    {
        $this->name = isset($data['name']) ? $data['name'] :null ;
        $this->email = isset($data['email']) ? $data['email'] : null ;
        $this->phone = isset($data['phone']) ? $data['phone'] : null ;
        
        $this->db = Database::getInstance();

        return $this;
    }

    public function save() : Requester
    {
        $sql = "INSERT INTO requester (name, email, phone)
                VALUES ('$this->name', '$this->email', '$this->phone');
        ";
        if($this->db->query($sql) === false) {
            throw new Exception($this->db->error);
        }
        $id = $this->db->insert_id;
        return self::find($id);

    }

    public static function find($id) : Requester
    {
        $sql ="SELECT * FROM requester WHERE id = '$id'";
        $self = new static;
        $res = $self->db->query($sql);
        if($res->num_rows < 1) return false;
        $self->populateObject($res->fetch_object());
        return $self;
    }

    public static function findAll() :array
    {
        $sql = "SELECT * FROM requester ORDER BY id DESC";
        $requesters = [];
        $self = new static;
        $res = $self->db->query($sql);
        
        if($res->num_rows < 1) return new static;

        while($row = $res->fetch_object()){
            $requester = new static;
            $requester->populateObject($row);
            $requesters[] = $requester;
        }

        return $requesters;
    } 

    /**
     * @param array [$column => $value] Takes an array as key value pair
     * @return  array Array of requester
     */ 
    public static function findByColumn($data) :array
    {
        $field = key($data);
        $value = $data[$field];

        $sql = "SELECT * FROM requester WHERE $field LIKE '%$value%' ORDER BY id DESC";
        $requesters = [];
        $self = new static;
        $res = $self->db->query($sql);
        
        if($res->num_rows < 1) return [];

        while($row = $res->fetch_object()){
            $requester = new static;
            $requester->populateObject($row);
            $requesters[] = $requester;
        }

        return $requesters;
    } 

    public static function delete($id) : bool 
    {
        $sql = "DELETE FROM requester WHERE id = '$id";
        $self = new static;
        return $self->db->query($sql);
    }

    public function populateObject($object) : void
    {

        foreach($object as $key => $property){
            $this->$key = $property;
        }
    }    
}