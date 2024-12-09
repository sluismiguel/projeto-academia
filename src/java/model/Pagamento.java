package model;

public class Pagamento {
    private int id;
    private int clienteId;
    private double valor;
    private String dataPagamento;

    // Construtores, getters e setters
    public Pagamento() {}

    public Pagamento(int id, int clienteId, double valor, String dataPagamento) {
        this.id = id;
        this.clienteId = clienteId;
        this.valor = valor;
        this.dataPagamento = dataPagamento;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getClienteId() { return clienteId; }
    public void setClienteId(int clienteId) { this.clienteId = clienteId; }

    public double getValor() { return valor; }
    public void setValor(double valor) { this.valor = valor; }

    public String getDataPagamento() { return dataPagamento; }
    public void setDataPagamento(String dataPagamento) { this.dataPagamento = dataPagamento; }
}
