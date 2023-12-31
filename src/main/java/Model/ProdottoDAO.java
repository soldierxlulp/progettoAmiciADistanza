package Model;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "ProdottoDAO", value = "/ProdottoDAO")
public class ProdottoDAO extends HttpServlet {
    public static ArrayList<Prodotto> doRetriveByCategoria(String categoria) {
        ArrayList<Prodotto> elencoProdotti = new ArrayList<Prodotto>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT idProdotto, nomeCategoria,nomeProd,descrizione,prezzo, quantita  FROM Prodotto WHERE nomeCategoria LIKE ?");
            ps.setString(1, categoria.concat("%"));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Prodotto p = new Prodotto();
                p.setIdProdotto(rs.getString(1));
                p.setNomeCategoria(rs.getString(2));
                p.setNomeProd(rs.getString(3));
                p.setDescrizione(rs.getString(4));
                p.setPrezzo(rs.getDouble(5));
                p.setQuantita(rs.getInt(6));
                elencoProdotti.add(p);
            }
            return elencoProdotti;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public static ArrayList<Prodotto> doRetriveAll() {
        ArrayList<Prodotto> elencoProdotti = new ArrayList<Prodotto>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT idProdotto, nomeCategoria,nomeProd,descrizione,prezzo, quantita FROM Prodotto");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Prodotto p = new Prodotto();
                p.setIdProdotto(rs.getString(1));
                p.setNomeCategoria(rs.getString(2));
                p.setNomeProd(rs.getString(3));
                p.setDescrizione(rs.getString(4));
                p.setPrezzo(rs.getDouble(5));
                p.setQuantita(rs.getInt(6));
                elencoProdotti.add(p);
            }
            return elencoProdotti;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Prodotto> doRetriveByFilter(String categoria, double max, double min) {
        ArrayList<Prodotto> elencoLetti = new ArrayList<Prodotto>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT idProdotto, nomeCategoria,nomeProd,descrizione,prezzo, quantita FROM Prodotto WHERE nomeCategoria LIKE ? AND prezzo>= ? AND prezzo<= ?");
            ps.setString(1, categoria.substring(0, categoria.length() - 1).concat("%"));
            ps.setDouble(2, min);
            ps.setDouble(3, max);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Prodotto p = new Prodotto();
                p.setIdProdotto(rs.getString(1));
                p.setNomeCategoria(rs.getString(2));
                p.setNomeProd(rs.getString(3));
                p.setDescrizione(rs.getString(4));
                p.setPrezzo(rs.getDouble(5));
                p.setQuantita(rs.getInt(6));
                elencoLetti.add(p);
            }
            return elencoLetti;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static Prodotto doRetriveBySearch(String nome) {
        Prodotto p = new Prodotto();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT idProdotto, nomeCategoria,nomeProd,descrizione,prezzo, quantita FROM Prodotto WHERE upper(nomeProd) LIKE ?");
            ps.setString(1, nome.concat("%"));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p.setIdProdotto(rs.getString(1));
                p.setNomeCategoria(rs.getString(2));
                p.setNomeProd(rs.getString(3));
                p.setDescrizione(rs.getString(4));
                p.setPrezzo(rs.getDouble(5));
                p.setQuantita(rs.getInt(6));
            }
            return p;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void doUpdateQuantita(int q,String idProdotto) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE Prodotto SET quantita=? WHERE idProdotto=?",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, q);
            ps.setString(2, idProdotto);
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void doSetNewPrezzo(double prezzo,String idProdotto) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE Prodotto SET prezzo=? WHERE idProdotto=?",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setDouble(1, prezzo);
            ps.setString(2, idProdotto);
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }







    public static ArrayList<Prodotto> doRetriveQuantitaEsaurita() {
        ArrayList<Prodotto> prodottiEsauriti = new ArrayList<Prodotto>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT idProdotto, nomeCategoria,nomeProd,descrizione,prezzo, quantita FROM Prodotto WHERE quantita=0");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Prodotto p = new Prodotto();
                p.setIdProdotto(rs.getString(1));
                p.setNomeCategoria(rs.getString(2));
                p.setNomeProd(rs.getString(3));
                p.setDescrizione(rs.getString(4));
                p.setPrezzo(rs.getDouble(5));
                p.setQuantita(rs.getInt(6));
                prodottiEsauriti.add(p);
            }
            return prodottiEsauriti;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void cancellaProdotto(String idProdotto){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("DELETE FROM Prodotto WHERE idProdotto=?",
                            Statement.RETURN_GENERATED_KEYS);
            ps.setString(1,idProdotto);
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }


    public static void aggiuntaProdotto(Prodotto p) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO Prodotto (idProdotto,nomeCategoria,nomeProd,descrizione,prezzo,quantita) VALUES (?,?,?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, p.getIdProdotto());
            ps.setString(2, p.getNomeCategoria());
            ps.setString(3, p.getNomeProd());
            ps.setString(4, p.getDescrizione());
            ps.setDouble(5, p.getPrezzo());
            ps.setInt(6, p.getQuantita());

            if (ps.executeUpdate() != 1)
                throw new RuntimeException("Errore nel definire il prodotto");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}