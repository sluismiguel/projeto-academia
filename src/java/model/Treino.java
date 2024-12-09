package model;

public class Treino {
    private int id;
    private int clienteId;
    private String descricao;
    private String dataInicio;
    private String dataFim;

    // Construtores, getters e setters
    public Treino() {}

    public Treino(int id, int clienteId, String descricao, String dataInicio, String dataFim) {
        this.id = id;
        this.clienteId = clienteId;
        this.descricao = descricao;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getClienteId() { return clienteId; }
    public void setClienteId(int clienteId) { this.clienteId = clienteId; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public String getDataInicio() { return dataInicio; }
    public void setDataInicio(String dataInicio) { this.dataInicio = dataInicio; }

    public String getDataFim() { return dataFim; }
    public void setDataFim(String dataFim) { this.dataFim = dataFim; }
}
