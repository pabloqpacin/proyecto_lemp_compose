<?php
class TeamMember{
    
    public $id = null;
    
    public $user = '';

    public $team = '';


    public function __construct($data = null) //u have to pass data when obj create,initially null
    {
        $this->user = isset($data['id']) ? $data['id'] : null ;
        $this->team = isset($data['team-id']) ? $data['team-id'] : null;
        
        $this->db = Database::getInstance(); //creating singleton obj,because it is static functn

        return $this;
    }

     //this function returns Teammember obj
    public function save() : TeamMember
    {
        $sql = "INSERT INTO team_member (user, team)
                VALUES ('$this->user', '$this->team')";
               // print_r($sql);die();
        if($this->db->query($sql) === false) {
            throw new Exception($this->db->error);
        }
        $id = $this->db->insert_id; //store last id in var,
        return self::find($id); //returns obj

    }

    public static function find($id) : TeamMember
    {
        $sql ="SELECT * FROM team_member WHERE id = '$id'";
        $self = new static; //ceate an obj, u dont need to create the obj 
        $res = $self->db->query($sql);
        if($res->num_rows < 1) return false;
        $self->populateObject($res->fetch_object());
        return $self;
    }

    public static function findByTeam($id) : array
    {
        $sql = "SELECT * FROM team_member WHERE team = '$id' ORDER BY id DESC";
        $members = [];
        $self = new static;
        $res = $self->db->query($sql);
        
        if($res->num_rows < 1) return [];

        while($row = $res->fetch_object()){
            $member = new static;
            $member->populateObject($row);
            $members[] = $member;
        }

        return $members;
    }

    public static function findAll() : array
    {
        $sql = "SELECT * FROM team_member ORDER BY id DESC";
        $members = [];
        $self = new static;
        $res = $self->db->query($sql);
        
        if($res->num_rows < 1) return new static;

        while($row = $res->fetch_object()){
            $member = new static;
            $member->populateObject($row);
            $members[] = $member;
        }

        return $members;
    } 

    public static function getName($id) : string 
    {
        $sql = "SELECT * FROM users WHERE id = '$id'";
        //print_r($sql);die;
        $self = new static;
        $res = $self->db->query($sql);
        return $res->fetch_object()->name;
    }

    public function populateObject($object) : void 
    {

        foreach($object as $key => $property){
            $this->$key = $property;
        }
    }



    
}