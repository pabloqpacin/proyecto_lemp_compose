<?php
class Event{
    
    
    public $id = '';

    public $ticket = '';

    public $user = '';

    public $body = '';

    private $db = null;


    public function __construct($data = null) 
    {
        $this->ticket = isset($data['ticket']) ? $data['ticket'] : null ;
        $this->user = isset($data['user']) ? $data['user'] : null ;
        $this->body = isset($data['body']) ? $data['body'] : null ;

        $this->db = Database::getInstance();

        return $this;
    }

    public function save() : Event 
    {
        $sql = "INSERT INTO ticket_event (ticket, user,  body)
                VALUES ('$this->ticket', '$this->user', '$this->body');
        ";
        
        if($this->db->query($sql) === false) {
            throw new Exception($this->db->error);
        }
        $id = $this->db->insert_id;
        return self::find($id);
    }

    public static function find($id) : Event
    {
        $sql ="SELECT * FROM ticket_event WHERE ticket = '$id'";
        $self = new static;
        $res = $self->db->query($sql);
        if($res->num_rows < 1) return $self;
        $self->populateObject($res->fetch_object());
        return $self;
    }

    public static function findAll() : array 
    {
        $sql = "SELECT * FROM ticket_event ORDER BY id DESC";
        $tickets = [];
        $self = new static;
        $res = $self->db->query($sql);
        
        if($res->num_rows < 1) return new static;

        while($row = $res->fetch_object()){
            $ticket = new static;
            $ticket->populateObject($row);
            $tickets[] = $ticket;
        }

        return $tickets;
    }

    public static function findByTicket($id) : array 
    {
        $sql = "SELECT * FROM ticket_event WHERE ticket = '$id'";
        //print_r($sql);die();
        $events = [];
        $self = new static;
        $res = $self->db->query($sql);
        
        if($res->num_rows < 1) return [];

        while($row = $res->fetch_object()){
            $event = new static;
            $event->populateObject($row);
            $events[] = $event;
        }

        return $events;
    }

    public function populateObject($object) : void{

        foreach($object as $key => $property){
            $this->$key = $property;
        }
    }


}