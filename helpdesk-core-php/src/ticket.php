<?php
class Ticket
{

    public $title = '';

    public $body = '';

    public $requester = null;

    public $team = null;

    public $team_member = null;

    public $status = '';

    public $priority = '';

    public $rating = '';


    private $db = null;

    public function __construct($data = null)
    {
        $this->title =  isset($data['title']) ? $data['title'] : null;
        $this->body = isset($data['body']) ? $data['body'] : null;
        $this->requester = isset($data['requester']) ? $data['requester'] : null;
        $this->team = isset($data['team']) ? $data['team'] : null;
        $this->team_member = isset($data['team_member']) ? $data['team_member'] : null;
        $this->status = isset($data['status']) ? $data['status'] : 'open';
        $this->priority = isset($data['priority']) ? $data['priority'] : 'low';

        $this->db = Database::getInstance();

        return $this;
    }

    public function save(): Ticket
    {
        $sql = "INSERT INTO ticket (title, body, requester, team, team_member, status, priority)
                VALUES ('$this->title', '$this->body', '$this->requester', '$this->team', '$this->team_member', '$this->status', '$this->priority')";

        if ($this->db->query($sql) === false) {
            throw new Exception($this->db->error);
        }
        $id = $this->db->insert_id;
        return self::find($id);
    }

    public static function find($id): Ticket
    {
        $sql = "SELECT * FROM ticket WHERE id = '$id'";
        $self = new static;
        $res = $self->db->query($sql);
        if ($res->num_rows < 1) {
            return false;
        }

        $self->populateObject($res->fetch_object());
        return $self;
    }

    public static function findAll(): array
    {
        $sql = "SELECT * FROM ticket ORDER BY id DESC";
        $tickets = [];
        $self = new static;
        $res = $self->db->query($sql);

        if ($res->num_rows < 1) {
            return new static;
        }

        while ($row = $res->fetch_object()) {
            $ticket = new static;
            $ticket->populateObject($row);
            $tickets[] = $ticket;
        }

        return $tickets;
    }

    public static function findByStatus($status): array
    {
        $sql = "SELECT * FROM ticket WHERE status = '$status' ORDER BY id DESC";
        //print_r($sql);die();
        $self = new static;
        $tickets = [];
        $res = $self->db->query($sql);

        while ($row = $res->fetch_object()) {
            $ticket[] = $row;
        }

        return $ticket;
    }

    public static function changeStatus($id, $status): bool
    {
        $self = new static;
        $sql = "UPDATE ticket SET status = '$status' WHERE id = '$id'";
        return $self->db->query($sql);
    }

    public static function delete($id): bool
    {
        $sql = "DELETE FROM ticket WHERE id = '$id'";
        // print_r($sql);die();
        $self = new static;
        return $self->db->query($sql);
    }

    public static function setRating($id, $rating): bool
    {
        $sql = "UPDATE ticket SET rating = '$rating' WHERE id = '$id'";
        $self = new static;
        return $self->db->query($sql);
    }

    public static function setPriority($id, $priority): bool
    {
        $sql = "UPDATE ticket SET priority = '$priority' WHERE id = '$id'";
        $self = new static;
        return $self->db->query($sql);
    }

    public function displayStatusBadge(): string
    {
        $badgeType = '';
        if ($this->status == 'open') {
            $badgeType = 'danger';
        } else if ($this->status == 'pending') {
            $badgeType = 'warning';
        } else if ($this->status == 'solved') {
            $badgeType = 'success';
        } else if ($this->status == 'closed') {
            $badgeType = 'info';
        }

        return '<div class="badge badge-' . $badgeType . '" role="badge"> ' . ucfirst($this->status) . '</div>';
    }

    public function populateObject($object): void
    {

        foreach ($object as $key => $property) {
            $this->$key = $property;
        }
    }

    public function update($id): Ticket
    {

        $sql = "UPDATE ticket set `team_member` = '$this->team_member', `title` = '$this->title',`body` = '$this->body',
         `requester`='$this->requester', `team`= '$this->team', `status`= '$this->status', `priority`='$this->priority'
          Where id = '$id'";

        if ($this->db->query($sql) === false) {
            throw new Exception($this->db->error);
        }

        return self::find($id);

    }

    public function unassigned()
    {

        $sql = "SELECT * FROM ticket WHERE team_member = '' ORDER BY id DESC";

        $self = new static;
        $tickets = [];
        $res = $self->db->query($sql);

        while ($row = $res->fetch_object()) {
            $tickets[] = $row;
        }

        return $tickets;

    }

    public static function findByMember($member)
     {

        $sql = "SELECT * FROM ticket WHERE team_member = '$member' ORDER BY id DESC";
        
        $self = new static;
        $tickets = [];
        $res = $self->db->query($sql);
        
        while($row = $res->fetch_object()){
            $ticket = new static;
            $ticket->populateObject($row);
            $tickets[] = $ticket;
        }

        return $tickets;

     }

}
