public class Equipamento {
    private int id;
    private String nome;
    private String descricao;
    private String status;

    // Construtores, getters e setters
    public Equipamento() {}

    public Equipamento(int id, String nome, String descricao, String status) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.status = status;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
