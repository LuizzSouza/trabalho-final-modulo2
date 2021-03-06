package com.dbc.repository;


import com.dbc.model.Address;
import com.dbc.model.PersoInfo;
import com.dbc.model.User;
import com.dbc.enums.Gender;
import com.dbc.enums.Pref;
import com.dbc.enums.ProgLangs;
import com.dbc.exceptions.BancoDeDadosException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements Actions<Integer, User> {

    @Override
    public Integer getProximoId(Connection connection) throws SQLException {
        String sql = "SELECT SEQ_TINDEV_USER.nextval mysequence FROM DUAL";

        Statement stmt = connection.createStatement();
        ResultSet res = stmt.executeQuery(sql);

        if(res.next()){
            return res.getInt("mysequence");
        }

        return null;
    }

    @Override
    public User register(User user) throws BancoDeDadosException {
        Connection con = null;
        try{
            con = ConexaoBancoDeDados.getConnection();

            Integer proximoId = this.getProximoId(con);
            user.setUserId(proximoId);

            String sql = "INSERT INTO TINDEV_USER\n"
                    + "(USER_ID, USERNAME, PASSWORD, PERSOINFO_ID_PERSOINFO, ADDRESS_ID_ADDRESS, PROGLANGS, GENDER, PREF)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)\n";

            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1,user.getUserId());
            stmt.setString(2,user.getUsername());
            stmt.setString(3,user.getPassword());
            stmt.setInt(4,user.getPersoInfo().getIdPersoInfo());
            stmt.setInt(5,user.getAddress().getIdAddress());
            stmt.setString(6, user.getProgLangs().toString());
            stmt.setString(7, user.getGender().toString());
            stmt.setString(8, user.getPref().toString());

            stmt.executeUpdate();
            return user;

        }catch (SQLException e) {
            throw new BancoDeDadosException(e.getCause());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<User> list() throws BancoDeDadosException {
        List<User> users = new ArrayList<>();
        Connection con = null;
        try {
            con = ConexaoBancoDeDados.getConnection();
            Statement stmt = con.createStatement();

            String sql = "SELECT * FROM TINDEV_USER tu LEFT OUTER JOIN  ADDRESS a ON tu.ADDRESS_ID_ADDRESS = a.ID_ADDRESS" +
                    " LEFT OUTER JOIN PERSOINFO pi ON tu.PERSOINFO_ID_PERSOINFO = pi.ID_PERSOINFO";

            // Executa-se a consulta
            ResultSet res = stmt.executeQuery(sql);

            while (res.next()) {
                User user = getUserFromResultSet(res);
                users.add(user);
            }
            return users;

        } catch (SQLException e) {
            throw new BancoDeDadosException(e.getCause());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public boolean delete(Integer id) throws BancoDeDadosException {
        Connection con = null;
        try {
            con = ConexaoBancoDeDados.getConnection();

            String sql = "DELETE FROM TINDEV_USER WHERE USER_ID = ?";

            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1, id);

            // Executa-se a consulta
            int res = stmt.executeUpdate();
            System.out.println("removerUserPorId.res=" + res);

            return res > 0;
        } catch (SQLException e) {
            throw new BancoDeDadosException(e.getCause());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public boolean edit(User user, User newUser) throws BancoDeDadosException {
        Connection con = null;
        try {
            con = ConexaoBancoDeDados.getConnection();

            String sql = "UPDATE TINDEV_USER SET " +
                    " USERNAME = ?," +
                    " PASSWORD = ?," +
                    " PROGLANGS = ?, " +
                    " PREF = ? " +
                    " WHERE USER_ID = ?";

            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, newUser.getUsername());
            stmt.setString(2, newUser.getPassword());
            stmt.setString(3, newUser.getProgLangs().toString());
            stmt.setString(4, newUser.getPref().toString());
            stmt.setInt(5, user.getUserId());

            // Executa-se a consulta
            int res = stmt.executeUpdate();
            System.out.println("editarPessoa.res=" + res);

            return res > 0;
        } catch (SQLException e) {
            throw new BancoDeDadosException(e.getCause());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private User getUserFromResultSet(ResultSet res) throws SQLException {
        User user = new User();
        PersoInfo persoInfo = new PersoInfo();
        Address address = new Address();
        user.setUserId(res.getInt("USER_ID"));
        user.setUsername(res.getString("USERNAME"));
        user.setPassword(res.getString("PASSWORD"));
        user.setProgLangs(ProgLangs.valueOf(res.getString("PROGLANGS")));
        user.setGender(Gender.valueOf(res.getString("GENDER")));
        user.setPref(Pref.valueOf(res.getString("PREF")));

        persoInfo.setIdPersoInfo(res.getInt("PERSOINFO_ID_PERSOINFO"));
        persoInfo.setRealName(res.getString("REALNAME"));
        persoInfo.setAge(res.getInt("AGE"));
        persoInfo.setEmail(res.getString("EMAIL"));

        address.setIdAddress(res.getInt("ADDRESS_ID_ADDRESS"));
        address.setStreet(res.getString("STREET"));
        address.setCity(res.getString("CITY"));
        address.setNumber(res.getInt("HOUSE_NUMBER"));

        user.setPersoInfo(persoInfo);
        user.setAddress(address);

        return user;
    }
}