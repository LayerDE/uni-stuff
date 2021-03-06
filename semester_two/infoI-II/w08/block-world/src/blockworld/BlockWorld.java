package blockworld;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Author Felix Karg, written 2017-06-16.
 */
public class BlockWorld {

    private char[][] emptyworld;
    private int width = 0;
    private int height = 0;
    private List<Block> blocks;

    /**
     *
     * @param width The width of the world
     * @param height The height of the world
     * @param blocks The blocks to live in this world
     * @param empty The character to be displayed if there
     *              is no block
     */
    public BlockWorld(int width, int height,
                      List<Block> blocks, char empty) {
        this.width = width;
        this.height = height;
        this.blocks = new ArrayList<Block>(blocks.size());
        for (Block block : blocks) {
            this.blocks.add(block.clone());
        }

        emptyworld = new char[width][height];
        // initializing the empty world
        for (int i = 0; i < width; i++) {
            for (int j = 0; j < height; j++) {
                emptyworld[i][j] = empty;
            }
        }

        for (int i = 0; i < this.blocks.size(); i++) {
            if (this.blocks.get(i).getXcoord() > width - 1) {
                throw new IllegalArgumentException("block can not exist in this World!");
            }
            if (this.blocks.get(i).getYcoord() > height - 1) {
                throw new IllegalArgumentException("block can not exist in this World!");
            }
            this.blocks.get(i).setMaxheight(height);
        }
    }

    /**
     * @return The width of the world
     */
    public int getWidth() {
        return width;
    }

    /**
     * @return The height of the world
     */
    public int getHeight() {
        return height;
    }

    /**
     * Observes the current state of the world
     * @return the current state of the world as Ascii-art
     */
    public char[][] observe() {
        // initializing the canvas
        char[][] canvas = new char[width][height];
        for (int i = 0; i < width; i++) {
            canvas[i] = Arrays.copyOf(emptyworld[i], height);
        }

        // drawing the blocks
        for (Block block : blocks) {
            canvas = block.draw(canvas, emptyworld[0][0]);
        }

        return canvas;
    }

    /**
     * makes one timestep in this world
     */
    public void step() {
        blocks.forEach(Block::step);
    }

    /**
     *
     * @return if the world is at a standstill
     */
    public boolean isDead() {

        for (Block block : blocks) {
            if (block.getYcoord() != height - 1 && block.getSpeed() != 0) {
                return false;
            }
        }
        return true;
    }
}
