<?php
class Team{
    
    public $id = null;
    
    public $name = '';


    public function __construct($data = null) 
    {
        $this->name = isset($data['name']) ? $data['name'] : null;
        
        $this->db = Database::getInstance();

        return $this;
    }

    public function save() : Team
    {
        $sql = "INSERT INTO team (name)
                VALUES ('$this->name');
        ";
        if($this->db->query($sql) === false) {
            throw new Exception($this->db->error);
        }
        $id = $this->db->insert_id;
        return self::find($id);

    }

    public static function find($id) : Team
    {
        $sql ="SELECT * FROM team WHERE id = '$id'";
        $self = new static;
        $res = $self->db->query($sql);
        if($res->num_rows < 1) return false;
        $self->populateObject($res->fetch_object());
        return $self;
    }

    public static function findAll() : array
    {
        $sql = "SELECT * FROM team ORDER BY id DESC";
        $teams = [];
        $self = new static;
        $res = $self->db->query($sql);
        
        if($res->num_rows < 1) return new static;

        while($row = $res->fetch_object()){
            $team = new static;
            $team->populateObject($row);
            $teams[] = $team;
        }

        return $teams;
    } 

    public static function delete($id) : bool 
    {
        $sql = "DELETE FROM team WHERE id = '$id'";
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