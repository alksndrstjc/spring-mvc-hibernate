package com.nicat.spring.Entity;

import javax.persistence.*;

@Entity
@Table(name = "ingredients")
public class Ingredient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_ingredient")
    private int id_ingredient;

    @Column(name = "flour")
    private int flour;

    @Column(name = "sugar")
    private int sugar;

    @Column(name = "eggs")
    private int eggs;

    @Column(name = "chocolate")
    private int chocolate;

    public Ingredient() {
    }

    public Ingredient(int flour, int sugar, int eggs, int chocolate) {
        this.flour = flour;
        this.sugar = sugar;
        this.eggs = eggs;
        this.chocolate = chocolate;
    }

    public int getId_ingredient() {
        return id_ingredient;
    }

    public void setId_ingredient(int id_ingredient) {
        this.id_ingredient = id_ingredient;
    }

    public int getFlour() {
        return flour;
    }

    public void setFlour(int flour) {
        this.flour = flour;
    }

    public int getSugar() {
        return sugar;
    }

    public void setSugar(int sugar) {
        this.sugar = sugar;
    }

    public int getEggs() {
        return eggs;
    }

    public void setEggs(int eggs) {
        this.eggs = eggs;
    }

    public int getChocolate() {
        return chocolate;
    }

    public void setChocolate(int chocolate) {
        this.chocolate = chocolate;
    }
}
